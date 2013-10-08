SPEC_DIR = File.expand_path(File.dirname(__FILE__))

require "bundler/setup"
Bundler.require(:test, :development, :defaults)

require "resque_log_error_parser"

RSpec.configure do |config|
  config.before(:each) do
    ResqueLogErrorParser.restore_defaults!
  end

  config.order = 'random'
end
