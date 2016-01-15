class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.string :category
      t.references :user, index: true, foreign_key: true
    end
  end
end
