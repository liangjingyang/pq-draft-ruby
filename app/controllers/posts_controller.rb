class PostsController < ApplicationController
  before_action :authenticate_user, except: [:mini_program]
  before_action :load_box, except: [:search]
  
  def index
    authorize! :display_posts, @box
    authorize! :index, Post
    @posts = Post.with_includes.order('created_at desc')
    @posts = @posts.page(params[:page] || 1)
  end

  def show
    authorize! :display_posts, @box
    authorize! :show, Post
    @post = Post.with_includes.where(box_id: @box.id).find(params[:id])
  end
  
  def create
    authorize! :update, @box
    authorize! :create, Post
    @post = @box.create_post!(create_params.merge(@box.user_id))    
  end

  def update
    authorize! :update, @box
    @post = Post.with_includes.where(box_id: @box.id).find(params[:id])
    authorize! :update, @post
    @post.update_attributes!(update_params)
  end

  def destroy
    authorize! :update, @box
    @post = Post.with_includes.where(box_id: @box.id).find(params[:id])
    authorize! :destroy, @post
    @post.destroy
  end

  def copy
    authorize! :display_posts, @box
    @copy = Post.with_includes.where(box_id: @box.id).find(params[:post_id])
    @post = @copy.copy_to(current_user.box)
    LOG_DEBUG(@post)
    render :show
  end

  private

  def load_box
    @box = Box.find(params[:box_id])
  end

  def create_params
    params.require(:post).permit(
      :content,
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
