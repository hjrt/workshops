module ApplicationHelper
  def active?(*paths)
    'active' if paths.any?{ |path| current_page?(path) }
  end

  def humanize_boolean(boolean)
    I18n.t((!!boolean).to_s)
  end
end
