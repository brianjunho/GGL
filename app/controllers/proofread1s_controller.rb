class Proofread1sController < ApplicationController
  before_action :set_proofread1, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:new, :create]
 

  # GET /proofread1s/new
  def new
    @proofread1 = Proofread1.new
    @edit = Edit.find(params[:edit_id])
    @listing = Listing.find(params[:listing_id])
  end

 

  # POST /proofread1s
  # POST /proofread1s.json
  def create
    @proofread1 = Proofread1.new(proofread1_params)
    @edit = Edit.find(params[:edit_id])
    @listing = Listing.find(params[:listing_id])

    @proofread1.editor_id = current_user.id
    @proofread1.edit_id = @edit.id

    respond_to do |format|
      if @proofread1.save
        format.html { redirect_to dashboard_path, notice: 'Proofread successfully submitted'  }
        format.json { render action: 'show', status: :created, location: @proofread1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @proofread1.errors, status: :unprocessable_entity }
      end
    end

     # move to the very last proofread
    current_user.balance = current_user.balance + (@listing.price * 0.15 * 0.25)
    current_user.save
    
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proofread1
      @proofread1 = Proofread1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proofread1_params
      params[:proofread1]
    end

  def check_user
      if !((current_user == Edit.find(params[:edit_id]).editor) || current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this belongs to someone else"
      end
    end
    
  end
