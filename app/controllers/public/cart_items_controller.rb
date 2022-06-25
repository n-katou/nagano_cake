class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum,item| sum + item.subtotal}
    # binding.pry
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    @new_cart_item.customer_id = current_customer.id
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount = @cart_item.amount.to_i + @new_cart_item.amount.to_i
      @cart_item.update(amount:@cart_item.amount)
      redirect_to cart_items_path
    else
      if @new_cart_item.save
        redirect_to cart_items_path
      else
      render :index
      end
    end

  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end

end