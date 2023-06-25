class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    item_set
    @order_address = OrderAddress.new
  end


  def create
    item_set
    #binding.pry
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
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :street, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order.item_price,  
      card: order_params[:token],
      currency: 'jpy'            
    )
  end
end
