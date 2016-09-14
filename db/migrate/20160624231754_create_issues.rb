class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name, null: false
      t.string :keywords, array: true, default: []
      t.string :slug
      t.timestamps null: false
    end
  end
end
