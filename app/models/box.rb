class Box < ApplicationRecord
  searchkick

  belongs_to :user, class_name: 'User', inverse_of: :boxes
  has_many :posts, class_name: 'Post', inverse_of: :box
  has_many :followed, class_name: 'BoxFollower', dependent: :destroy
  has_many :followed_users, through: :following, class_name: 'User', source: :user

  scope :with_includes, -> { includes(:user) }

  after_create :generate_qrcode_token
  after_create :development_things

  def image
    s = super
    if s.present? && !(s =~ /^https?:\/\//)
      s = "#{DRAFT_CONFIG['qiniu_cname']}/#{s.gsub(/^https?:\/\/.*?\//, '')}"
    end
    return s
  end

  def is_mine(user)
    user.try(:id) == self.user_id
  end

  # def is_allowed(user)
  #   return true if is_mine(user)
  #   box_follower = followed.find_by(user_id: user.try(:id))
  #   return box_follower.present? && box_follower.allowed
  # end

  include NumberGenerator
  def generate_number(options = {})
    options[:prefix] ||= NumberGenerator::PREFIX_BOX
    super(options)
  end

  def generate_qrcode_token
    _, token = Draft::TOKEN_GENERATOR.generate(Box, :qrcode_token)
    self.update_column(:qrcode_token, token)
  end

  def qrcode_token_valid?(qrcode_token)
    self.qrcode_token == qrcode_token
  end

  def development_things
    return if Rails.env == 'production'
    return if self.id <= 100
    (1..100).to_a.each do |id|
      u = User.find(id)
      BoxFollower.create(user_id: u.id, box_id: self.id) if u
    end

    (1..100).to_a.each do |id|
      u = User.find(id)
      BoxFollower.create(user_id: self.user_id, box_id: u.box.id) if u
    end
  end

  def create_post!(post_params)
    self.posts.create!(post_params.merge(user_id: self.user_id))
  end
end
