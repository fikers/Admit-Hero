class TagLib < ActiveRecord::Base
	has_many :passive_article_tag_relationships, class_name:  "ArticleTagRelationship",
                                  				 foreign_key: "tag_id",
                                  				 dependent: :destroy
    has_many :has_articles, through: :passive_article_tag_relationships, source: :article
end
