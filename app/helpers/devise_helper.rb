module DeviseHelper
  def devise_error_messages!
    return '' unless devise_error_messages?
    flash[:error] = resource.errors.full_messages.to_sentence
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
