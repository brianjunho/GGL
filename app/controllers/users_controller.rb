class UsersController < ApplicationController
  def index
  	@user = User.all
  	
  end

  def show
    @user = User.find_by_name(params[:name])
  end
end
