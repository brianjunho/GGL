class PagesController < ApplicationController
before_filter :check_user, only: [:orders, :payouts]
before_filter :authenticate_user!, only: [:resources]

  def home
  end

  def about
  end

  def contact
  end
  
  def pricing
  end

  def team
  end
  
  def testimonial
  end

  def orders
  end

  def payouts
  end

  def privacy
  end

  def terms
  end

  def resources
  end

   def check_user
      if !(current_user.try(:admin?))
        redirect_to root_url, alert: "Sorry, this cannot be accessed"
      end
    end
   
end
