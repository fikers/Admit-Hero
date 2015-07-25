class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :summer_programs, :default => false
      t.boolean :scholarships, :default => false
      t.boolean :stem, :default => false
      t.boolean :humanities, :default => false
      t.boolean :computer_science, :default => false
      t.boolean :traveling, :default => false
      t.boolean :community_service, :default => false
      t.boolean :research, :default => false
      t.boolean :internships, :default => false
      t.boolean :arts, :default => false

      t.timestamps null: false
    end
  end
end
