class BoxSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image, :name
end 