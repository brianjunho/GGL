class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:index]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

 
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    
    @order.customer_id = current_user.id
    @order.listing_id = @listing.id

     respond_to do |format|
      if @order.save
        format.html { redirect_to dashboard_path, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end

    def check_user
      if !(current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this order belongs to someone else"
      end
    end
end
