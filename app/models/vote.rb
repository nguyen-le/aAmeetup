class Vote < ActiveRecord::Base
  belongs_to :feature
  belongs_to :user

  validates :user, :feature, presence: true
  validates_uniqueness_of :user, scope: :feature
end

