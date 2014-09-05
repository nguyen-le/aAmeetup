class Feature < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :votes
end
