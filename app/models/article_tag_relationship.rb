class ArticleTagRelationship < ActiveRecord::Base
	belongs_to :tag, class_name: "TagLib"
	belongs_to :article, class_name: "Article"
	validates :article_id, presence: true
	validates :tag_id, presence: true
end
