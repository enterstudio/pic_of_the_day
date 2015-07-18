require 'test_helper'

class FilePickerTest < Minitest::Test
  def setup
    @files = ['pics/a.jpg', 'pics/b.jpg', 'pics/c.jpg', 'other_pics/d.jpg', 'bla/e.jpg']
    tempfile = Tempfile.new('file_picker_test')
    @picker = PicOfTheDay::FilePicker.new(files: @files, blacklist_file_path: tempfile.path)
  end

  def test_pick
    picked_files = []

    @files.size.times do
      picked_files << @picker.pick
    end

    assert_equal @files.sort, picked_files.sort
    assert_equal nil, @picker.pick
  end
end
