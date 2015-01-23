module ApplicationHelper
  def possible_date item
    item.nil? ? 'Not set' : item.strftime("%a, %B %d")
  end
  def long_date date
    date.strftime("%A %B %d, %I:%M%P")
  end
end
