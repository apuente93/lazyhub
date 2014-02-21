def full_title(page_title)
  base_title = "Lazy Hub - the entertainment system for the web"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end