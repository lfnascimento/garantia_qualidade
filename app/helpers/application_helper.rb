module ApplicationHelper
  def alert_type(type)
    case type
    when 'error'
      'danger'
    when 'success'
      'success'
    else
      'info'
    end
  end
end
