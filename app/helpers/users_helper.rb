module UsersHelper
  def format_member_since(user)
    user.created_at.strftime("%B %Y")
  end

  def profile_image(user, options={})
    size = options[:size] || 80
    url = "http://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
    image_tag(url, alt: user.name)
  end
end
