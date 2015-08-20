class Tag < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true

	def select_true_tags
		attributes.select{|key, value| value==true}
	end

end
