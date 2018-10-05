class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit destroy update accept cancel]
  before_action :check_ready, only: %i[show edit]

  def index
    @orders = current_user.orders.default_sort
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

  def accept
    @order.in_work! if @order.valuated?
    redirect_to @order
  end

  def cancel
    @order.cancel! if @order.valuated?
    redirect_to @order
  end

  private

  def set_order
    @order = current_user.orders.where(id: params[:id]).first
    redirect_to orders_path unless @order.present?
  end

  def order_params
    params.require(:order).permit(:description, :image)
  end

  def check_ready
    redirect_to orders_path if @order.ready?
  end
end
