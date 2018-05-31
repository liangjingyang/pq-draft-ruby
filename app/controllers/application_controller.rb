class ApplicationController < ActionController::API
  include ActionView::Rendering
  include ActionLogger
  include ResponseCode

  # for knock
  include Knock::Authenticable

  # before_action do
  #   authenticate_for User
  # end

  helper_method :current_user
  
  def authenticate_user
    if current_user
      if Rails.cache.read(CACHE_JWT(current_user.id)) != token
        LOG_DEBUG("authenticate_user failed, cache expired!")
        raise Draft::Exception::UserUnauthorized.new 
      else
        LOG_DEBUG("authenticate_user success, current_user: #{current_user}")
      end
    else
      LOG_DEBUG(params)
      LOG_DEBUG("authenticate_user failed, user unauthorized")
      raise Draft::Exception::UserUnauthorized.new 
    end
  end

  def authenticate_admin
    uid = current_user.try(:uid) || params[:admin_token]
    unless uid == 'oCvQn1MvhYMsWsKz5QlrVVK-dSGg'
      return raise Draft::Exception::UserUnauthorized.new
    end
  end

  def current_ability
    Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied, with: :render_access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActionController::RoutingError, with: :render_route_not_found
  rescue_from ActionController::UnknownController, with: :render_controller_not_found
  rescue_from Draft::Exception::UserUnauthorized, with: :render_user_unauthorized
  rescue_from ActiveRecord::RecordInvalid do |e|
    render_response_code(:record_invalid, e.message) 
  end

  rescue_from ActiveModel::RangeError do |e|
    render_response_code(:range_error)
  end

  private
  def render_record_not_found
    render_response_code(:record_not_found)
  end

  def render_route_not_found
    render_response_code(:route_not_found)
  end

  def render_controller_not_found
    render_response_code(:controller_not_found)
  end
  
  def render_user_unauthorized
    render_response_code(:user_unauthorized)
  end

  def render_access_denied
    render_response_code(:access_denied)
  end

  def render_response_code(sym, message = nil)
    @response_code = response_sym_to_hash(sym, message)
    render 'shared/response_code', status: response_sym_to_status(sym) 
  end

  def render_success
    @response_code = response_sym_to_hash(:success)
    render 'shared/response_code'
  end

  def render_failure
    @response_code = response_sym_to_hash(:failure)
    render 'shared/response_code'
  end
end
