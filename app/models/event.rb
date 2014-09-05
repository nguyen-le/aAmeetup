class Event < ActiveRecord::Base
  validates :title, :location, :date, :time, :user_id, :presence => true

  has_many :chats

  belongs_to :user
end
