class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    item_set
    @order_address = OrderAddress.new
  end


  def create
    binding.pry
    item_set
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :street, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,  
      card: order_params[:token],
      currency: 'jpy'            
    )
  end
end
