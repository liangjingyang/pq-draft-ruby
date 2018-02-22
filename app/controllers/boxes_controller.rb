class BoxesController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def show
    if params[:number].present?
      @box = Box.with_includes.find_by(number: params[:number])
    else
      @box = Box.with_includes.find(params[:id])
    end
  end

  def update
    @box = Box.with_includes.find(params[:id])
    authorize! :update, @box
    @box.update_attributes!(update_params)
  end

  def generate_qrcode_token
    @box = Box.with_includes.find(params[:box_id])
    authorize! :update, @box
    @box.generate_qrcode_token
    render :show
  end

  def following_boxes
    authorize! :index, Box
    page = params[:page] || 1
    @boxes = current_user.following_boxes
      .with_includes.joins(:followed)
      .order('box_followers.created_at desc')
      .page(page)
      .per(30)
    render :index
  end

  private
  def update_params
    params.require(:box).permit(
      :name,
      :image,
    )
  end

end
