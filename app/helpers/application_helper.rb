module ApplicationHelper
  def setting(name)
  	Setting.where(name: name).first.try(:value).to_s
  end

  def bot_request?
    return true
    user_agent =  request.env['HTTP_USER_AGENT'].downcase
    user_agent.index('googlebot')
  end
end
