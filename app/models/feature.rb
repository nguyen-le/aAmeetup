class Feature < ActiveRecord::Base
  has_many :votes

  validates :name, :description, presence: true
end
