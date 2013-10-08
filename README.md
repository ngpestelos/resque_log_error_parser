# Resque Log File Error Parser

Resque worker that parses log files given filters, and executes a callback of your choice.

## Install

    gem "resque_log_file_error_parser"

## Setup:

    ResqueLogFileErrorParser.queue = :queue_the_worker_should_listen_to
    ResqueLogFileErrorParser.on_error do |line_in_log_with_error|
      # You can email yourself, or report to PagerDuty like:
      p = Pagerduty.new("key here")
      p.trigger("Error found: #{line_in_log_with_error}")
    end

    # If your logs are located in a place other than "log/*.log", then you need to override the log_paths:
    ResqueLogFileErrorParser.log_paths = ["some/other/*.log"]

## Scheduling

ResqueLogFileErrorParser is intended to be run periodically (e.g. every hour) using `resque_scheduler` or `cron`.

## Processing log entries

Right now, the worker will only process log lines that match the following format (assuming the job was executed on Oct 7, 2013, between 6pm and 7pm):

    E, [2013-10-07T18:01:04.194981 #28727] ERROR -- : Error line today

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
