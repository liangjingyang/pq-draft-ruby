class PostsController < ApplicationController
  before_action :authenticate_user, except: [:mini_program]
  before_action :load_box, except: [:search]
  
  def index
    authorize! :display_posts, @box
    authorize! :index, Post
    @posts = @box.posts
    @posts = @posts.page(params[:page] || 1)
  end
  
  def create
    authorize! :update, @box
    authorize! :create, Post
    @post = @box.posts.create!(create_params)    
  end

  def update
    authorize! :update, @box
    @post = @box.posts.find(params[:id])
    authorize! :update, @post
    @post.update_attributes!(update_params)
  end

  def destroy
    authorize! :update, @box
    @post = @box.posts.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
  end

  def search
    box_ids = current_user.all_box_ids
    @posts = Post.where(box_id: box_ids)
    if params[:q].present?
      @posts = @posts.where("content LIKE ?", "%#{params[:q]}%")
    end
    @posts = @posts.page(params[:page] || 1)
  end

  def mini_program
    @posts = Post.where(mini_program: true, box_id: params[:box_id]).order('created_at desc')
    @posts = @posts.page(params[:page] || 1)
  end

  private

  def load_box
    @box = Box.find(params[:box_id])
  end

  def create_params
    params.require(:post).permit(
      :content,
      :parent_id,
      :mini_program,
      :images => []
    )
  end

  def update_params
    params.require(:post).permit(
      :content,
      :mini_program,
      :images => []
    )
  end
end
