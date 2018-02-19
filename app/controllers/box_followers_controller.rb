class BoxFollowersController < ApplicationController
  before_action :authenticate_user

  def index
    authorize! :index, BoxFollower
    page = params[:page] || 1
    box_id = current_user.box.id
    @box_followers = BoxFollower.where(box_id: box_id).page(page).per(30)
  end

  def update
    @box_follower = BoxFollower.find(params[:id])
    authorize! :update, @box_follower
    @box_follower.update_attributes!(update_params)
  end

  def destroy
    @box_follower = BoxFollower.find(params[:id])
    authorize! :destroy, @box_follower
    @box_follower.destroy
  end

  private
  def update_params
    params.require(:box_follower).permit(
      :allowed
    )
  end
end
