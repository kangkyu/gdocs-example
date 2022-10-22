class ApplicationController < ActionController::Base
  def ensure_signed_in
    unless signed_in?
      store_request_url
      redirect_to new_session_url
    end
  end

  def signed_in?
    current_user_id.present?
  end
  helper_method :signed_in?

  def current_user_id
    session[:user_id]
  end

  def current_user
    @current_user ||= current_user_id && User.find(current_user_id)
  end
  helper_method :current_user

  def ensure_signed_out
    if signed_in?
      redirect_to(root_url)
    end
  end

  def store_request_url
    session[:redirect_to] = request.url
  end
end
