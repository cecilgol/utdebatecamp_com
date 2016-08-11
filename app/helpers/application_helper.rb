# lol

module ApplicationHelper

  def twitterized_type(type)
    case type.to_sym
    when :error
      'alert-danger'
    when :success
      'alert-success'
    when :warning
      'alert-warning'
    else
      'alert-info'
    end
  end

end
