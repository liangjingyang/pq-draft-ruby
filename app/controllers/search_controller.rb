class SearchController < ApplicationController
  before_action :authenticate_user

  def post
    box_ids = current_user.all_box_ids
    @posts = Post.where(box_id: box_ids)
    if params[:q].present?
      @posts = @posts.where("content LIKE ?", "%#{params[:q]}%")
    end
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    @posts = @posts.page(params[:page])
  end
 
  def box
    box_ids = current_user.all_box_ids
    @boxes = Box.where(id: box_ids)
    if params[:q].present?
      @boxes = @boxes.where("name LIKE ?", "%#{params[:q]}%")
    end
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    @boxes = @boxes.page(page).per(per_page)
  end

  def box_follower
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    box_id = current_user.box.id
    @box_followers = BoxFollower.joins(:user).where('box_followers.box_id = ?', box_id).page(page).per(per_page)
    if params[:q].present?
      @box_followers = @box_followers.where("users.name LIKE ?", "%#{params[:q]}%")
    end
  end

  def all
    params.merge(per_page: 3)
    box
    post
    box_follower
  end

end
