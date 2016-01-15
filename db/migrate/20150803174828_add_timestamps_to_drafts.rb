class AddTimestampsToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :created_at, :datetime
    add_column :drafts, :updated_at, :datetime
  end
end
