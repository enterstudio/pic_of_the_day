require 'action_mailer'

ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.view_paths = File.expand_path('../../../templates/', __FILE__)

module PicOfTheDay
  class Mailer < ActionMailer::Base
    def mail_with_picture(from:, to:, subject:, image_path:)
      @filename = File.basename(image_path)
      attachments.inline[@filename] = File.read(image_path)

      mail(
        from: from,
        to: to,
        subject: subject,
        template_path: "",
        content_type: 'text/html'
      )
    end
  end
end
