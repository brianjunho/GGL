class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:requester, :index, :new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_filter :check_status, only: [:edit]

  def requested
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.order("created_at DESC")
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.word_count = @listing.application.scan(/[\w-]+/).size
    

    if @listing.option == "0" # basic proofread
        if @listing.word_count < 1100
                @listing.price = @listing.word_count * 0.33
        else
                @listing.price = @listing.word_count * 0.30
        end
    else
        if @listing.word_count < 1100 # with comments
                @listing.price = @listing.word_count * 0.66
        else
                @listing.price = @listing.word_count * 0.60
        end
    end
     
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to requester_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :prompt, :application, :option)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end

    def check_status
      if !@listing.edit.nil?
        redirect_to root_url, alert: "Sorry, this listing has already been proofread"
      end
    end

    
end
