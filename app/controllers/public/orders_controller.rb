class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum,item| sum + item.subtotal}
  end

  def complete
  end

  def create

  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:amount_claimed,:postage,:payment_method,:status)
  end

end
