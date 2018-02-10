class Box < ApplicationRecord
  belongs_to :user, class_name: 'User', inverse_of: :boxes
  has_many :posts, class_name: 'Post', inverse_of: :box
  has_many :followed, class_name: 'BoxFollower', dependent: :destroy
  has_many :followed_users, through: :following, class_name: 'User', source: :user

  def image
    s = super
    if s.present? && !(s =~ /^https?:\/\//)
      s = "#{DRAFT_CONFIG['qiniu_cname']}/#{s.gsub(/^https?:\/\/.*?\//, '')}"
    end
    return s
  end

  def is_mine(user)
    user.id == self.user_id
  end

  include NumberGenerator
  def generate_number(options = {})
    options[:prefix] ||= NumberGenerator::PREFIX_BOX
    super(options)
  end

  def generate_qrcode_token
    jwt = ::Knock::AuthToken.new(payload: {sub: self.id})
    jwt.token
  end

  def qrcode_token_valid?(qrcode_token)
    jwt = ::Knock::AuthToken.new(token: token)
    Time.now.to_i <= jwt.payload[:exp]
  end
end
