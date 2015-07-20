require 'action_mailer'

# ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.view_paths = File.expand_path('../../../templates/', __FILE__)

module PicOfTheDay
  class Mailer < ActionMailer::Base
    def mail_with_picture(from:, to:, subject:, image_path:)
      @filename = File.basename(image_path)
      attachments[@filename] = File.binread(image_path)

      options = {
        from: from,
        to: to,
        subject: subject,
      }

      mail(**options) do |format|
        format.html
      end
    end
  end
end
