class UserController < ApplicationController
  
  # private profile page
  def show
    @user = User.find_by_name(params[:name])
  end


 
end
