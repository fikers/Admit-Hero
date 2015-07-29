class TagLib < ActiveRecord::Base
	has_many :passive_relationships, class_name: "TagArticleRelationship",
									 foreign_key: "tag_id",
									 dependent: :destroy
end
