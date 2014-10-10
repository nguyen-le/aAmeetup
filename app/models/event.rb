class Event < ActiveRecord::Base
  belongs_to :user
  has_many :chats
  has_many :rsvps

  validates :title, :location, :date, :time, :user_id, :presence => true
end
