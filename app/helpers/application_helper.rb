module ApplicationHelper
  def icon(type)
    content_tag(:i, "", class: "fa fa-#{type}")
  end

  def iconnew(type)
    content_tag(:i, "", class: "icon-essential-light-#{type}")
  end

  def nav_link(icon_type, url)
    link_to icon(icon_type), url, class: active_if_current_page(url)
  end

  def active_if_current_page(url)
    :active if current_page? url
  end

  def back_or_default_link(default)
    link_to icon(:"chevron-left"), request.referrer || default
  end
end
