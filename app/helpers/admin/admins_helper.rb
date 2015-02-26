module Admin::AdminsHelper
  def full_title(page_title = '')
    base_title = "Admin Panel"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
