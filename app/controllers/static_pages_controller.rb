class StaticPagesController < ApplicationController

	def home 
		if logged_in?
			usertags = Array.new
			@articles = Array.new
			truetags = current_user.tag.select_true_tags
			truetags.each do |key, value|
				tag = TagLib.find_by(tag: key)
				usertags.push(tag)
			end
			usertags.each do |tag|
				tag.has_articles.each do |article|
					@articles.push(article) unless @articles.include?(article)
				end
			end
			@articles = @articles.sort_by{|hash| -hash['id']}
		end
	end

	def about
	end

end
