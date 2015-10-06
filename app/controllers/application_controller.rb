class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session

  helper_method :current_user

  before_filter :set_headers

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD, LINK'
#   headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Set-Cookie'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = '86400'
  end

end
