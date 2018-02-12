class BoxFollower < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :box, class_name: 'Box'
  default_scope { order(created_at: :desc) }
end
