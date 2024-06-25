class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_receiver = OrderReceiver.new
    @item = Item.find(params[:item_id])
    @user = User.find(current_user.id)
  end

  def create
    @order_receiver = OrderReceiver.new(order_params)

    if @order_receiver.valid?
      pay_item
      @order_receiver.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_receiver).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge( user_id: params[:current_user_id], item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id || item.order.present?
      redirect_to root_path 
    end
  end
end
