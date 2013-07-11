module ApplicationHelper
  def format_date(datetime)
    if datetime.nil?
      datetime
    else
      datetime.strftime("%Y-%m-%d")
    end
  end

  def joined?(user_id, project_id)
    Participation.where(user_id: user_id, project_id: project_id).blank? ? false : true
  end

  ALERT_TYPES = [:error, :info, :success, :warning]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def date_merge(project)
    start = project.started_at
    finish = project.finished_at
    return '' if start.blank? || finish.blank?
    text = I18n.localize(start, :format => format_year(start))
    if start == finish
      text
    else
      text + " - #{I18n.localize(finish, :format => format_year(finish))}" unless finish.nil?
    end
  end

  def sortable(column, title = nil)
    
      title ||= column.titleize
      css_class = column == sort_column ? "#{sort_direction + "_sortable"}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  private
  def format_year(time)
    (time.year == Time.zone.now.year) ? :stamp : :stamp_with_year
  end

  end
