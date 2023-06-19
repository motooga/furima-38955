class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAdress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(oder_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :street, :building_name, :phone_number).merge(user_id :current_user.id, item_id: @item.id)
  end

end
