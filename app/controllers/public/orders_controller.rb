class Public::OrdersController < ApplicationController
  def new

  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum,item| sum + item.subtotal}

  end

  def complete
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to confirm_path
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
