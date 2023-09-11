class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :judge_sold, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item[:id])
    else 
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, 
                                 :item_price, {images: []}).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    return if user_signed_in?
    redirect_to new_user_session_path
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def judge_sold
    set_item
    if
    Order.exists?(item_id: @item.id)
    redirect_to root_path
    end
  end

end

