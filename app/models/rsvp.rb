class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :user_id, :event_id, presence: true
  validates_uniqueness_of :user_id, scope: :event_id
end
