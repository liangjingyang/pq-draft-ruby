class SearchController < ApplicationController
  before_action :authenticate_user

  def post
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    box_ids = current_user.all_box_ids
    @posts = Post.with_includes
      .where(box_id: box_ids)
      .where("posts.content LIKE ?", "%#{params[:q]}%")
      .order('posts.created_at desc')
      .page(page).per(per_page)
  end
 
  def box
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    @boxes = current_user.following_boxes
      .with_includes.joins(:followed)
      .where("boxes.name LIKE ?", "%#{params[:q]}%")
      .order('box_followers.created_at desc')
      .page(page).per(per_page)
  end
  
  def box_follower
    page = params[:page] || 1
    per_page = params[:per_page] || 30
    box_id = current_user.box.id
    @box_followers = current_user.box.followed
      .with_includes.joins(:user)
      .where('users.name LIKE ?', "%#{params[:q]}%")
      .order('box_followers.created_at desc')
  end

  def all
    params.merge!(per_page: 3)
    box
    post
    box_follower
  end

end
