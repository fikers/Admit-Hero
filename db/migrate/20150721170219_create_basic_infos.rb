class CreateBasicInfos < ActiveRecord::Migration
  def change
    create_table :basic_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :birthday

      t.timestamps null: false
    end
  end
end
