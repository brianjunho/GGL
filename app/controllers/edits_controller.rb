class EditsController < ApplicationController
  before_action :set_edit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:show, :edit]
 
  
    # GET /edits
  # GET /edits.json
  def index
    @edits = Edit.all
  end

  # GET /edits/1
  # GET /edits/1.json
  def show
  end

  def edit
  end

  # GET /edits/new
  def new
    @edit = Edit.new
    @listing = Listing.find(params[:listing_id])
  end

  # POST /edits
  # POST /edits.json
  def create
    @edit = Edit.new(edit_params)
    @listing = Listing.find(params[:listing_id])
    @requester = @listing.user

    @edit.listing_id = @listing.id
    @edit.editor_id = current_user.id
    @edit.requester_id = @requester.id
    

    respond_to do |format|
      if @edit.save
        format.html { redirect_to dashboard_path, notice: 'Proofread was successfully created.' }
        format.json { render action: 'show', status: :created, location: @edit }
      else
        format.html { render action: 'new' }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      @edit = Edit.new(edit_params)
    @listing = Listing.find(params[:listing_id])
    @requester = @listing.user

    @edit.listing_id = @listing.id
    @edit.editor_id = current_user.id
    @edit.requester_id = @requester.id

    respond_to do |format|
      if @edit.update(edit_params)
        format.html { redirect_to dashboard_path, notice: 'Proofread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit
      @edit = Edit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_params
      params.require(:edit).permit(:proofread, :comments)
    end

    def check_user
      if !((current_user == @edit.requester) || (current_user == @edit.editor) || current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this belongs to someone else. Let's go somewhere else!"
      end
    end

end
