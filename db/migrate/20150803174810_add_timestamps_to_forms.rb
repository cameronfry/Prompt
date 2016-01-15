class AddTimestampsToForms < ActiveRecord::Migration
  def change
    add_column :forms, :created_at, :datetime
    add_column :forms, :updated_at, :datetime
  end
end
