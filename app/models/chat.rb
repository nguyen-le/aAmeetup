class Chat < ActiveRecord::Base
  belongs_to :user

  validates :text, :user_id, presence: true
  validates :type, inclusion: [:school, :fun]
end
