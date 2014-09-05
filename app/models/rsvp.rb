class Rsvp < ActiveRecord::Base
  validates :user_id, :event_id, presence: true
  validates_uniqueness_of :user_id, scope: :event_id
  
  belongs_to :user
  belongs_to :event
end
