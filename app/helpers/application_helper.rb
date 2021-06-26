module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user, size=100)
    if user.avatar.attached?
      user.avatar.variant(resize_to_limit: [size, size])
    else
      'default_avatar'
    end
  end

  def is_admin?
    return unless current_user

    current_user.is_admin
  end

  def rounded_grade(activity)
    activity.ratings.average(:grade).round
  rescue NoMethodError
    0
  end

  def role(user)
    user.is_admin ? 'admin' : 'user'
  end
end
