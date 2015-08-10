class StaticPagesController < ApplicationController

  def home 
    @user = User.new
    
  	@articles  = {}
  	current_user.tags.each do |key, value|
  		if value == true 
  			tag = TagLib.find_by(tag: key)
  			tag.has_articles.each do |article|
  				unless @articles.include?(article)
  					@articles.push(article)
  				end
  			end
  		end
  	end

  end

  def about
  end

  def contact
  end
  
  def team
  end
  
  def contact
  end
  
end
