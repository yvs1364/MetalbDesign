module ApplicationHelper
  def current_class?(test_path)
    return "links-menu links-menu-active" if request.path == test_path

    "links-menu"
  end
end
