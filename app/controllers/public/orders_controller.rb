class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end

    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum,item| sum + item.subtotal}
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.amount = cart.amount
        order_item.price = cart.item.price
        order_item.save
      end
      redirect_to complete_path
      cart_items.destroy_all
    end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:amount_claimed,:postage,:payment_method,:status)
  end

end
