class EditsController < ApplicationController
  before_action :set_edit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /edits
  # GET /edits.json
  def index
    @edits = Edit.all
  end

  # GET /edits/1
  # GET /edits/1.json
  def show
  end

  # GET /edits/new
  def new
    @edit = Edit.new
    @listing = Listing.find(params[:listing_id])
  end

  # GET /edits/1/edit
  def edit
  end

  # POST /edits
  # POST /edits.json
  def create
    @edit = Edit.new(edit_params)
    @listing = Listing.find(params[:listing_id])
    @requester = @listing.user

    @edit.listing_id = @listing.id
    @edit.editor_id = current_user.id
    @edit.requester_id = @seller.id

    respond_to do |format|
      if @edit.save
        format.html { redirect_to @edit, notice: 'Edit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @edit }
      else
        format.html { render action: 'new' }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edits/1
  # PATCH/PUT /edits/1.json
  def update
    respond_to do |format|
      if @edit.update(edit_params)
        format.html { redirect_to @edit, notice: 'Edit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @edit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edits/1
  # DELETE /edits/1.json
  def destroy
    @edit.destroy
    respond_to do |format|
      format.html { redirect_to edits_url }
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
      params.require(:edit).permit(:proofread, :comments)
    end
end
