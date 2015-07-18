module PicOfTheDay
  class FilePicker
    def initialize(files:, blacklist_file_path:)
      @files = files
      @blacklist_file_path = blacklist_file_path
    end

    def pick
      picked_file = random_file
      return if picked_file.nil?
      blacklist_file(picked_file)
      picked_file
    end

    private

    def random_file
      unused_files.sample
    end

    def unused_files
      @files - blacklisted_files
    end

    def blacklisted_files
      if File.exist?(@blacklist_file_path)
        File.readlines(@blacklist_file_path).map(&:chomp)
      else
        []
      end
    end

    def blacklist_file(file_path)
      File.open(@blacklist_file_path, 'a') do |f|
        f.puts(file_path)
      end
    end
  end
end
