module ApplicationHelper
  def possible_date item
    item.nil? ? 'Not set' : item.strftime("%a, %B %d")
  end
end
