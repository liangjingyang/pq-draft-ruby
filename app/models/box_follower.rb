class BoxFollower < ApplicationRecord
  belongs_to :user, class_name: 'User', inverse_of: :box_followers
  belongs_to :box, class_name: 'Box', inverse_of: :followed
  scope :with_includes, -> { includes(:user, :box) }
end
