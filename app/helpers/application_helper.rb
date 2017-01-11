# lol

module ApplicationHelper

  def utnif_type(type)
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

  def unread_blog_posts
    if current_user
      c = NewsPost.where("created_at > ? and published = true", current_user.last_sign_in_at).count
      c > 0 ? c : ""
    end
  end
end
