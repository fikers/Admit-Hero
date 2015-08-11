class Article < ActiveRecord::Base
	has_many :active_article_tag_relationships, class_name:  "ArticleTagRelationship",
                                  				foreign_key: "article_id",
                                  				dependent: :destroy
    has_many :has_tags, through: :active_article_tag_relationships, source: :tag
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true
    validates :content, presence: true
    validates :description, presence: true

    def mark(tag)
    	active_article_tag_relationships.create(tag_id: tag.id)
    end

    def unmark(tag)
    	active_article_tag_relationships.find_by(tag.id).destroy
    end

    def has_tag?(tag)
    	has_tags.include?(tag)
    end
end
