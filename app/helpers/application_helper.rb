module ApplicationHelper
  def set_meta_title(text)
    content_for :title, text
  end

  def set_meta_description(text)
    content_for :description, text
  end
end
