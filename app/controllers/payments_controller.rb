class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:show, :index]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

   # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.proofreader_id = current_user.id

    
      
      Stripe.api_key = ENV["STRIPE_API_KEY"]
      token = params[:stripeToken]

      recipient = Stripe::Recipient.create(
        :name => @payment.legalname,
        :type => "individual",
        :bank_account => token
        )
        current_user.recipient = recipient.id
        current_user.save
      

      transfer = Stripe::Transfer.create(
        :amount => (@payment.request * 97).floor,
        :currency => "usd",
        :recipient => current_user.recipient
        )

      current_user.balance = current_user.balance - @payment.request
      current_user.save

             respond_to do |format|
      if @payment.save
        format.html { redirect_to dashboard_path, notice: 'Payment was successfully made. You should see your money in your account within 7 business days.' }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:legalname, :request)
    end

    def check_user
      if !((current_user==@payment.proofreader) || current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this belongs to someone else"
      end
    end
end
