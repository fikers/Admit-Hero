class StaticPagesController < ApplicationController
	def home 
		if logged_in?
			@usertags = Array.new
			truetags = current_user.tag.attributes.select{|key, value| value==true}
			truetags.each do |key, value|
				tag = TagLib.find_by(tag: key)
				@usertags.push(tag)
			end
		end
	end

	def about
	end
end
