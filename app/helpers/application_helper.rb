require 'code_formatter'

module ApplicationHelper
  def meta_tag(name, value)
    %(<meta name="#{name}" content="#{Rack::Utils.escape_html(value)}"/>).html_safe
  end

  def time_tag(time)
    %(<time datetime="#{time.to_s}">#{time.strftime("%B %d, %Y")}</time>).html_safe
  end

  def textilize(text)
    CodeFormatter.new(text).to_html.html_safe unless text.blank?
  end
end
