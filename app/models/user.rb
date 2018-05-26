class User < ApplicationRecord
  extend Draft::WX

  acts_as_paranoid
  has_many :action_logs, class_name: 'ActionLog'
  has_many :boxes, class_name: 'Box', inverse_of: :user, dependent: :destroy
  has_many :posts, class_name: 'Post', inverse_of: :user
  has_many :box_followers, -> { where(allowed: true) }, class_name: 'BoxFollower', dependent: :destroy
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
    if permited_params[:token].present? # 绑定微信 | 微信登录
      access_token_res = get_access_token(permited_params[:token])
      user_info_res = get_user_info(access_token_res['access_token'], access_token_res['openid'])
      uid = user_info_res['unionid']
      name = user_info_res['nickname']
      user = User.find_by(
        uid: uid, 
        provider: permited_params[:provider]
      )
      unless user.present?
        if permited_params[:uuid].present? # 绑定微信
          user = User.find_or_create_by(
            uuid: permited_params[:uuid], 
          )
        else
          user = User.create!(uid: uid, provider: permited_params[:provider], name: name)
        end
      end
      user.uuid = nil # 微信绑定后, 关闭游客模式
      user.uid = uid
      user.provider = permited_params[:provider]
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
      user.box.update_column(:name, name)
      return user
    elsif permited_params[:uuid].present?
      user = User.find_or_create_by(
        uuid: permited_params[:uuid], 
      )
      user.image = 'FhTGbaiYXMT7Of_n0uj22_sdUeaH.jpg'
      user.name = "产品册#{user.id}"
      user.save!
      return user
    end
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
    Box.distinct
      .left_joins(:followed)
      .where('box_followers.user_id = ? OR boxes.user_id = ?', self.id, self.id)
      .pluck(:id)
  end

  def movement_updated_at
    Box.distinct
      .left_joins(:followed)
      .where('box_followers.user_id = ? OR boxes.user_id = ?', self.id, self.id)
      .order('boxes.updated_at desc')
      .first
      .updated_at
  end

  def movement_image
    "http://cdn.draftbox.cn/1/e8e1074931cfe8d00963ff1ce1851b6a.jpg"
  end

  private
  def create_box
    box_name = self.name || "产品册#{self.id}"
    self.boxes.create!(name: box_name, image: "http://cdn.draftbox.cn/FhTGbaiYXMT7Of_n0uj22_sdUeaH.jpg") if self.boxes.blank?
  end

end
