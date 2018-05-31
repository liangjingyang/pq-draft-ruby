class Admin::PostsController < ApplicationController
  before_action :authenticate_admin

  def index
    if params[:box_id].present?
      @posts = Post.where(box_id: params[:box_id])
    else
      @posts = Post.all
    end
    @posts = @posts.order('posts.created_at desc').page(params[:page] || 1)
  end
end
