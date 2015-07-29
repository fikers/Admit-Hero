class CreateTagArticleRelationships < ActiveRecord::Migration
  def change
    create_table :tag_article_relationships do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps null: false
    end

    add_index :tag_article_relationships, :tag_id
    add_index :tag_article_relationships, :article_id
    add_index :tag_article_relationships, [:tag_id, :article_id], unique: true
  end
end
