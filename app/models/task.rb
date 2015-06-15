class Task < ActiveRecord::Base
  belongs_to :user
  enum status: ['active', 'done']

  validates :text, presence: true
  validates :user_id, presence: true
end
