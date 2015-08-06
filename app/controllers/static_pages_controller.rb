class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def about
  end
  
  def team
  end
  
  def contact
  end
  
end
