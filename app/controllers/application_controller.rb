class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :redirect

  def redirect
    redirect_to 'https://www.radialtattoos.com', status: 301
  end
end
