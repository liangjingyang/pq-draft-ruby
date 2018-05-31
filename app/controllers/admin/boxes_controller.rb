class Admin::BoxesController < ApplicationController
  before_action :authenticate_admin

  def index
    @boxes = Box.all
    @boxes = @boxes.order('boxes.created_at desc').page(params[:page] || 1)
  end
end
