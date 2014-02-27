class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:show]
  


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
    @order.amount = @listing.price

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.price * 100).floor,
        :currency => "cny",
        :card => token
        )
      flash[:notice] = "Thanks for ordering! Check back soon for your completed proofread"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

     respond_to do |format|
      if @order.save
        format.html { redirect_to dashboard_path }
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
      if !((current_user == @listing.user) || current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this order belongs to someone else"
      end
    end
    
end
