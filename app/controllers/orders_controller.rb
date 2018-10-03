class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def edit; end

  def update
    if @order.update_attributes(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description, :image)
  end

  def authorize_user
    authorize! Order
  end
end
