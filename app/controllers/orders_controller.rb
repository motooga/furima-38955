class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation
  before_action :judge_sold

  def index
    set_item
    @order_address = OrderAddress.new
  end


  def create
    set_item
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

  def set_item
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

  def judge_sold
    set_item
    if Order.exists?(item_id: @item.id)
    redirect_to root_path
    end
  end

  def contributor_confirmation
    set_item
    if current_user == @item.user
    redirect_to root_path 
    end
  end

end
