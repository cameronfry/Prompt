class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.string :title
      t.string :type
      t.string :text
      t.references :form, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
