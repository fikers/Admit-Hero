class BasicInfo < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :birthday, length: {maximum: 8, minimum: 8}

end
