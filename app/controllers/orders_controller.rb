class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    @order = Order.create(oder_params)
    Address.create(address_params)
    redorect_to root_path
  end

  private

  def order_params
    params.merge(item_id: current_item.id).merge(user_id: current_user.id)
  end

  def address_paramd
    prams.permit(:postal_code, :item_prefecture_id, :city, :street, :building_name, :phone_number).merge(order_id: @order.id)
  end
end
