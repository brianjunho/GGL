class EditsController < ApplicationController
  before_action :set_edit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:show, :edit]
  before_filter :check_status, only: [:new]
 
    # GET /edits/1
  # GET /edits/1.json
  def show
    @listing = Listing.find(params[:listing_id])
  end

  def edit
     @listing = Listing.find(params[:listing_id])
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
    @edit.word_count = @edit.proofread.scan(/[\w-]+/).size
    @edit.average_score = (@edit.one_score.to_f + @edit.two_score.to_f + @edit.three_score.to_f + @edit.four_score.to_f)/4

    @requester = @listing.user

    @edit.listing_id = @listing.id
    @edit.editor_id = current_user.id
    @edit.requester_id = @requester.id    

    respond_to do |format|
      if @edit.save
        format.html { redirect_to listing_edit_path(@listing, @edit) }
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
        format.html { redirect_to listing_edit_path(@edit.listing, @edit) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @edit.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit
      @edit = Edit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_params
      params.require(:edit).permit(:proofread, :one_score, :one_reason, :one_suggestion, :two_score, :two_reason, :two_suggestion, :three_score, :three_reason, :three_suggestion, :four_score, :four_reason, :four_suggestion, :comments)
    end

    def check_user
      if !((current_user == @edit.requester) || (current_user == @edit.editor) || current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this belongs to someone else. Let's go somewhere else!"
      end
    end

    def check_status
        if !@edit.nil?
          redirect_to root_url, alert: "Sorry, this listing has already been proofread"
        end
     end
end
