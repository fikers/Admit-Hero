class CreateTagLibs < ActiveRecord::Migration
  def change
    create_table :tag_libs do |t|
      t.string :tag

      t.timestamps null: false
    end
  end
end
