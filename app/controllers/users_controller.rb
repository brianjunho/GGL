class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@user = User.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def view_logged_in
    @user = User.all

  end

  def view_logged_out
    @user = User.find(params[:name])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
end
