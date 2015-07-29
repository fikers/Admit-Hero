class Article < ActiveRecord::Base
	has_many :active_relationships, class_name: "TagArticleRelationship",
									 foreign_key: "article_id",
									 dependent: :destroy
end
