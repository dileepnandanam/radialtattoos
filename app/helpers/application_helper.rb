module ApplicationHelper
  def setting(name)
  	Setting.where(name: name).first.try(:value).to_s
  end
end
