module ResqueLogErrorParser
  class Worker

    def self.queue
      if ResqueLogErrorParser.queue.nil?
        raise ArgumentError, "you must set ResqueLogErrorParser.queue"
      end

      ResqueLogErrorParser.queue
    end

    def self.perform
      self.log_files.each do |file|
        self.lines_for(file).each do |line|
          ResqueLogErrorParser.error_handler.call(line)
        end
      end
    end

    private

    def self.log_files
      ResqueLogErrorParser.log_paths.map do |log_path|
        Dir.glob(log_path)
      end.flatten
    end

    def self.lines_for(file)
      lines = Lines.new(File.open(file).lines.to_a)
      lines.filter_by(self.filters).strip_newlines
    end

    def self.filters
      [self.time_filter_regex, ResqueLogErrorParser.line_filter_keys].flatten
    end

    def self.time_filter_regex
      time_filter_str = Time.now.strftime(ResqueLogErrorParser.line_date_format)
      /#{time_filter_str}/
    end

  end
end
