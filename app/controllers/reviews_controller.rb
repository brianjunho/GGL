class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :check_user, only: [:show, :edit, :update, :destroy]
  # GET /reviews
  # GET /reviews.json
  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

 
  # GET /reviews/new
  def new
    @review = Review.new
    @user = User.find(params[:user_id])
  end

  # GET /reviews/1/edit
  def edit
  end
 
  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @reviewee = @user
    @review.reviewer_id = current_user.id
    @review.reviewee_id = @reviewee.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to dashboard_path, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @reviewee = @user
    @review.reviewer_id = current_user.id
    @review.reviewee_id = @reviewee.id
    
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :statement)
    end

    def check_user
    if !((current_user == @review.reviewee) || (current_user == @review.reviewer) || (current_user.try(:admin?)))
      redirect_to root_url, alert: "Sorry, this review belongs to someone else"
    end
  end
end
