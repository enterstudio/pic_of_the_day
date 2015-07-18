require 'optparse'

module PicOfTheDay
  class OptionParser
    def initialize(args)
      @args = args
    end

    def parse
      options = {}
      options[:blacklist_file_path] = "#{ENV['PWD']}/pic_of_the_day.blacklist"

      parser = ::OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [options]"

        opts.on("-f", "--from ADDRESS", "From") do |from|
          options[:from] = from
        end

        opts.on("-t", "--to ADDRESS", "To") do |to|
          options[:to] = to
        end

        opts.on("-s", "--subject SUBJECT", "Subject") do |subject|
          options[:subject] = subject
        end

        opts.on("-b", "--blacklist", "Blacklist file path (default: #{options[:blacklist_file_path]}") do |blacklist|
          options[:blacklist_file_path] = blacklist
        end
      end

      parser.parse!(@args)

      [:from, :to, :subject].each do |key|
        next if options.key?(key)
        raise MissingArgumentError, "Missing required argument --#{key}"
      end

      options[:files] = @args
      options
    end
  end
end
