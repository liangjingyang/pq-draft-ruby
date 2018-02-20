class BoxesController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def index
    authorize! :index, Box
    page = params[:page] || 1
    # @boxes = Box.all.page(page)
    @boxes = Box.accessible_by(current_ability).where(id: current_user.all_box_ids).page(page).per(30)
  end

  def show
    if params[:number].present?
      @box = Box.find_by(number: params[:number])
    else
      @box = Box.find(params[:id])
    end
  end

  def update
    @box = Box.find(params[:id])
    authorize! :update, @box
    @box.update_attributes!(update_params)
  end

  def generate_qrcode_token
    @box = Box.find(params[:box_id])
    authorize! :update, @box
    @box.generate_qrcode_token
    render :show
  end

  def following_boxes
    authorize! :index, Box
    page = params[:page] || 1
    # @boxes = Box.all.page(page)
    @boxes = current_user.following_boxes.page(page).per(30)
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
