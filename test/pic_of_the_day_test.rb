require 'test_helper'

class PicOfTheDayTest < Minitest::Test
  def test_version_number
    refute_nil ::PicOfTheDay::VERSION
  end

  def test_send_email
    tempfile = Tempfile.new('pic_of_the_day_test')

    PicOfTheDay.send_email(
      from: "bob@bob.com",
      to: "alice@alice.com",
      subject: "Hello!",
      files: [ __FILE__ ],
      blacklist_file_path: tempfile.path
    )
  end

  def test_send_email_no_images_left
    tempfile = Tempfile.new('pic_of_the_day_test')
    tempfile.puts(__FILE__)
    tempfile.close

    assert_raises(PicOfTheDay::NoImagesLeft) do
      PicOfTheDay.send_email(
        from: "bob@bob.com",
        to: "alice@alice.com",
        subject: "Hello!",
        files: [ __FILE__ ],
        blacklist_file_path: tempfile.path
      )
    end
  end
end
