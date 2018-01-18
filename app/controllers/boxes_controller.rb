class BoxesController < ApplicationController
  before_action :authenticate_user, except: [:show]

  def index
    authorize! :index, Box
    page = params[:page] || 1
    @boxes = Box.accessible_by(current_ability).page(page)
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

  def search
    box_ids = current_user.all_box_ids
    @boxes = Box.where(id: box_ids)
    if params[:q].present?
      @boxes = @boxes.where("name LIKE ?", "%#{params[:q]}%")
    end
    page = params[:page] || 1
    @boxes = @boxes.page(page)
  end

  private
  def update_params
    params.require(:box).permit(
      :name,
      :image,
    )
  end
end
