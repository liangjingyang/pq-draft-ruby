class SearchController < ApplicationController
  before_action :authenticate_user

  def post
    box_ids = current_user.all_box_ids
    @posts = Post.where(box_id: box_ids)
    if params[:q].present?
      @posts = @posts.where("content LIKE ?", "%#{params[:q]}%")
    end
    @posts = @posts.page(params[:page] || 1)
  end
 
  def box
    box_ids = current_user.all_box_ids
    @boxes = Box.where(id: box_ids)
    if params[:q].present?
      @boxes = @boxes.where("name LIKE ?", "%#{params[:q]}%")
    end
    page = params[:page] || 1
    @boxes = @boxes.page(page)
  end

  def all
    box
    post
  end

end
