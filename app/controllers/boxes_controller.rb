class BoxesController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def show
    if params[:number].present?
      @box = box_with_includes.find_by(number: params[:number])
    else
      @box = box_with_includes.find(params[:id])
    end
  end

  def update
    @box = box_with_includes.find(params[:id])
    authorize! :update, @box
    @box.update_attributes!(update_params)
  end

  def generate_qrcode_token
    @box = box_with_includes.find(params[:box_id])
    authorize! :update, @box
    @box.generate_qrcode_token
    render :show
  end

  def following_boxes
    authorize! :index, Box
    page = params[:page] || 1
    @boxes = box_with_includes
      .where('box_followers.user_id = ?', current_user.id)
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

  def box_with_includes
    Box.includes(:followed, :user)
  end
end
