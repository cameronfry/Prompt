class Form < ActiveRecord::Base
  belongs_to :user
  has_many :drafts
  has_many :questions
end
