require 'test_helper'

class PicOfTheDayTest < Minitest::Test
  def test_version_number
    refute_nil ::PicOfTheDay::VERSION
  end
end
