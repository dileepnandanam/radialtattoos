class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_canonical

  def redirect
    redirect_to 'https://www.radialtattoos.com', status: 301 if Rails.env.production?
  end

  protected

  def bot_request?
    user_agent =  request.env['HTTP_USER_AGENT'].downcase
    user_agent.index('googlebot')
  end

  def redirect_to_canonical
    host = request.host
    scheme = request.scheme
    if !host.include?('www') || scheme != 'https'
      #redirect_to 'https://www.radialtattoos.com'
    end
  end
end
