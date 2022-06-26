class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @postage = 800
  end

  def update
  end

end
