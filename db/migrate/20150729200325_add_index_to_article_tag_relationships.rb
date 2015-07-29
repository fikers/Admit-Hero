class AddIndexToArticleTagRelationships < ActiveRecord::Migration
  def change
  	add_index :article_tag_relationships, [:article_id, :tag_id], unique: true
  end
end
