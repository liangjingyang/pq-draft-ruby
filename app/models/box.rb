class Box < ApplicationRecord
  belongs_to :user, class_name: 'User', inverse_of: :boxes
  has_many :posts, class_name: 'Post', inverse_of: :box

  def image
    s = super
    if s.present? && !s =~ /^https?:\/\//
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

end
