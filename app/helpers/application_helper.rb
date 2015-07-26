module ApplicationHelper
  def owner?(object:)
    object.user == current_user
  end
end
