class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer
      t.references :form, index: true, foreign_key: true
    end
  end
end
