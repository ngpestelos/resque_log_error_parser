module ResqueLogErrorParser
  DEFAULT_LOG_PATHS = ["log/*.log"]
  DEFAULT_LINE_DATE_FORMAT = '%Y-%m-%dT%H'
  DEFAULT_LINE_FILTER_KEYS = ["ERROR"]

  def self.queue=(q)
    @queue = q
  end

  def self.queue
    @queue
  end

  def self.log_paths
    return [@log_paths].flatten unless @log_paths.nil?
    return DEFAULT_LOG_PATHS
  end

  def self.log_paths=(paths)
    @log_paths = paths
  end

  def self.on_error(&block)
    @on_error = block
  end

  def self.error_handler
    @on_error
  end

  def self.line_date_format
    DEFAULT_LINE_DATE_FORMAT
  end

  def self.line_filter_keys
    DEFAULT_LINE_FILTER_KEYS
  end

  def self.restore_defaults!
    self.log_paths = DEFAULT_LOG_PATHS
  end

end

require "resque_log_error_parser/worker"
require "resque_log_error_parser/lines"
