class StaticPagesController < ApplicationController
	def home 
		if logged_in?
			tags = {}
			truetags = current_user.tag.select {|key, value| value == true}
			truetags.each do |key, value|
				usertag= TagLib.find_by(tag: key)
				tags.push(usertag)
			end
			@feedtags = tags.paginate(page: 5)
		end
	end

	def about
	end
end
