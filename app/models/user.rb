class User < ApplicationRecord
  acts_as_paranoid
  has_many :action_logs, class_name: 'ActionLog'

  def from_token_request(params)
    # TODO: find or create user by weixin
    User.find_or_create_by!(uid: params[:auth][:uid])
  end

  # for jwt, gem knock
  def to_token_payload
    {
      sub: self.id,
      uid: self.uid,
      name: self.name,
    }
  end

end
