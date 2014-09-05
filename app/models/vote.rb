class Vote < ActiveRecord::Base
  validates :user, :feature, presence: true
  validates_uniqueness_of :user, scope: :feature

  belongs_to :feature
  belongs_to :user
end

