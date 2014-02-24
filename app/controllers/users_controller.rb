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
  def like
    user = User.find(params[:id])
    current_user.toggle_like!(user) # => This assumes you have a variable current_user who is authenticated
    redirect_to :back
  end 

  def unlike
    user = User.find(params[:id])
    current_user.unlike!(user) # => This assumes you have a variable current_user who is authenticated
    redirect_to :back
  end

   def view_logged_out
    @user = User.find(params[:name])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
end
