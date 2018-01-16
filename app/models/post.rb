class Post < ApplicationRecord
  belongs_to :box, class_name: 'Box', inverse_of: :posts
end
