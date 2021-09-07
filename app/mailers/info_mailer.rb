class InfoMailer < ApplicationMailer
  default to: -> { User.pluck(:email) }

  def information_email(content: nil, subject: nil)
    return unless content or content

    @content = content

    mail(subject: subject)
  end
end
