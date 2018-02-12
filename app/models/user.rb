class User < ApplicationRecord
  extend Draft::WX

  acts_as_paranoid
  has_many :action_logs, class_name: 'ActionLog'
  has_many :boxes, class_name: 'Box', inverse_of: :user, dependent: :destroy
  has_many :box_followers, class_name: 'BoxFollower', dependent: :destroy
  has_many :following_boxes, through: :box_followers, class_name: 'Box', source: :box
  
  after_create :create_box
  
  def image
    s = super
    if s.present? && !(s =~ /^https?:\/\//)
      s = "#{DRAFT_CONFIG['qiniu_cname']}/#{s.gsub(/^https?:\/\/.*?\//, '')}"
    end
    return s
  end

  def self.from_token_request(permited_params)
    return if permited_params[:token].blank?
    access_token_res = get_access_token(permited_params[:token])
    user_info_res = get_user_info(access_token_res['access_token'], access_token_res['openid'])
    uid = user_info_res['unionid']
    name = user_info_res['nickname']
    user = User.find_by(
      uid: uid, 
      provider: permited_params[:provider]
    )
    unless user.present?
      user = User.create!(uid: uid, provider: permited_params[:provider], name: name)
    end
    user.uid = uid
    user.image = user_info_res['headimgurl']
    user.name = user_info_res['nickname']
    user.language = user_info_res['language']
    user.country = user_info_res['country']
    user.province = user_info_res['province']
    user.city = user_info_res['city']
    user.sex = user_info_res['sex']
    user.provider_token = access_token_res['access_token']
    user.provider_refresh_token = access_token_res['refresh_token']
    user.save!
    return user
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
    self.boxes.last
  end

  def all_box_ids
    self.following_boxes.all.pluck(:id) + boxes.all.pluck(:id)
  end

  private
  def create_box 
    self.boxes.create!(name: self.name, image: "http://cdn.draftbox.cn/FhTGbaiYXMT7Of_n0uj22_sdUeaH.jpg") if self.boxes.blank?
  end

end
