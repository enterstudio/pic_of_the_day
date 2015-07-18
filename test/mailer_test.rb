require 'test_helper'
require 'action_mailer/test_helper'

class MailerTest < Minitest::Test
  include ActionMailer::TestHelper

  def setup
    @from = "bob@bob.com"
    @to = "alice@alice.com"
    @subject = "Picture of the day"

    @mailer = PicOfTheDay::Mailer.mail_with_picture(
      from: @from,
      to: @to,
      subject: @subject,
      image_path: __FILE__
    )
  end

  def test_foo
    assert_emails(1) do
      @mailer.deliver_now
    end

    mail = ActionMailer::Base.deliveries.last
    assert_equal [@from], mail.from
    assert_equal [@to], mail.to
    assert_equal @subject, mail.subject

    parts = mail.body.parts
    assert_equal 2, parts.size
  end
end
