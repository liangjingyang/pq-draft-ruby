class User < ApplicationRecord
  acts_as_paranoid
  has_many :action_logs, class_name: 'ActionLog'
  has_many :boxes, class_name: 'Box', inverse_of: :user, dependent: :destroy
  has_many :following, class_name: 'FollowingBox', dependent: :destroy
  has_many :following_boxes, through: :following, class_name: 'Box', source: :box
  
  after_create :create_box

  def self.from_token_request(permited_params)
    User.find_or_create_by!(
      uid: permited_params[:uid], 
      provider: permited_params[:provider]
    )
  end

  # for jwt, gem knock
  def authenticate(password)
    true
  end

  # for jwt, gem knock
  def to_token_payload
    {
      sub: self.id,
      uid: self.uid,
      name: self.name,
    }
  end

  def box
    boxes.last
  end

  def all_box_ids
    following_boxes.all.pluck(:id) + boxes.all.pluck(:id)
  end

  private
  def create_box
    self.boxes.create!(name: "#{self.name}") if self.boxes.blank?
  end

end
