class UsersController < ApplicationController
  before_action :authenticate_user

  def upload_res_token
    @box = Box.find(params[:box_id])
    authorize! :create, @box
    @uptoken = Draft::Qiniu.generate_uptoken
  end

  def uri_parser
    @uri_parser = UriParser.new(current_user, params[:uri])
    @uri_parser.parse
  end

  def me
    @user = current_user
    render :show
  end

  def movement
    box_ids = current_user.all_box_ids
    @posts = Post.where(box_id: box_ids)
    @posts = @posts.page(params[:page] || 1)
  end
  
end
