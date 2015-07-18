require "pic_of_the_day/version"
require "pic_of_the_day/file_picker"
require "pic_of_the_day/mailer"
require "pic_of_the_day/option_parser"

module PicOfTheDay
  Error = Class.new(::StandardError)
  NoImagesLeftError = Class.new(Error)
  MissingArgumentError = Class.new(Error)

  def self.send_email(from:, to:, subject:, files:, blacklist_file_path:)
    @picker = PicOfTheDay::FilePicker.new(files: files, blacklist_file_path: blacklist_file_path)

    if picked_image = @picker.pick
      @mailer = PicOfTheDay::Mailer.mail_with_picture(from: from, to: to, subject: subject, image_path: picked_image)
      @mailer.deliver_now
    else
      raise NoImagesLeftError, "There are no images left that haven't been used yet."
    end
  end
end
