module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user, size=100)
    if user.avatar.attached?
      user.avatar.variant(resize_to_limit: [size, size])
    else
      'default_avatar'
    end
  end
end
