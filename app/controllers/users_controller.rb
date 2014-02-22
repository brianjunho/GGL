class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@user = User.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
  end

  def view_logged_out
    @user = User.find(params[:id])
     respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
  
end
