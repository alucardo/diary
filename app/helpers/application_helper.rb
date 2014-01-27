module ApplicationHelper


  def active_link_to(options = {}, html_options = {}, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)

  end

end
