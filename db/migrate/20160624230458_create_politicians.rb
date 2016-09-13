class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name, null: false
      t.string :political_party, null: false
      t.string :title, null: false
      t.string :twitter_handle, null: false
      t.string :twitter_profile, null: false
      t.string :slug, null: false
      t.string :tweets, array: true, default: []


      t.timestamps null: false
    end
  end
end

