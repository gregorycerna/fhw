module ApplicationHelper
  def possible_date item
    item.nil? ? 'Not set' : item.strftime("%a, %B %d")
  end
  def long_date date
    date.nil? ? '' : date.strftime("%A %B %d, %I:%M%P")
  end
  def current_user_is_labor_czar
    user_signed_in? && current_user.isLaborCzar
  end
end
