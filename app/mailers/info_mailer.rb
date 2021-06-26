class InfoMailer < ApplicationMailer
  default to: -> { 'mateuszlata97@gmail.com' }

  def information_email(content: nil, subject: nil)
    return unless content or content

    @content = content

    mail(subject: subject)
  end
end
