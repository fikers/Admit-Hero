class StaticPagesController < ApplicationController
  
  def home 
    @article = Article.find(1)
  end

  def about
    
  end
  

  
end
