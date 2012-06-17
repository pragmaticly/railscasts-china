module ApplicationHelper
  def meta_tag(name, value)
    %(<meta name="#{name}" content="#{Rack::Utils.escape_html(value)}"/>).html_safe
  end
end
