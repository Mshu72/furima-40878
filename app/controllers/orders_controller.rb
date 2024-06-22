class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_receiver = OrderReceiver.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_receiver = OrderReceiver.new(order_params)
    if @order_receiver.valid?
      pay_item
      @order_receiver.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_receiver).permit(:price_id, :user_id, :postal_code, :prefecture, :city, :address, :building, :phone_number).merge( token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: order_params[:price],
    card: order_params[:token],
    currency: 'jpy'
    )
  end
end
