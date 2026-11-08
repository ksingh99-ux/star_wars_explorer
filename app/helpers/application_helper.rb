module ApplicationHelper
  # Menu link that is highlighted when you are on that page
  def nav_link(label, path)
    active = current_page?(path)
    link_to label, path,
            class: ["nav-link", ("active" if active)].compact.join(" "),
            aria: (active ? { current: "page" } : {})
  end

  # Adds a unit (cm, kg...) only when the value is a number, so "unknown" stays "unknown"
  def with_unit(value, unit)
    value.to_s.match?(/\A[\d.,]+\z/) ? "#{value} #{unit}" : value
  end
end
