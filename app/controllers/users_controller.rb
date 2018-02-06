class UsersController < ApplicationController
  before_action :authenticate_user

  def upload_res_token
    @box = Box.find(params[:box_id])
    authorize! :create, @box
    # 要上传的空间
    bucket = 'draftbox'
    # @upkey = "#{current_user.id}/#{@box.id}/"
    @upkey = nil
    # 上传到七牛后保存的文件名
    # 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        @upkey,
        300    # token 过期时间，默认为 3600 秒，即 1 小时
    )
    put_policy.is_prefixal_scope = 1
    @uptoken = Qiniu::Auth.generate_uptoken(put_policy)
  end

end
