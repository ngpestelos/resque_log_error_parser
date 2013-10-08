require "spec_helper"

describe ResqueLogErrorParser::Worker do

  describe ".queue" do
    it "refers to the queue set in ResqueLogErrorParser" do
      ResqueLogErrorParser.queue = :q
      expect(described_class.queue).to eq(:q)
      ResqueLogErrorParser.queue = :r
      expect(described_class.queue).to eq(:r)
    end

    context "when queue has not been set on ResqueLogErrorParser" do
      it "raises an error" do
        ResqueLogErrorParser.queue = nil
        expect { described_class.queue }.to raise_error(ArgumentError, "you must set ResqueLogErrorParser.queue")
      end
    end
  end

  describe ".perform" do
    it "should call the error_handler block for each matching line in the logs for the given hour" do
      Timecop.travel(2013, 10, 6, 17)

      ResqueLogErrorParser.log_paths = "#{SPEC_DIR}/fixtures/log/*.log"
      lines = []
      ResqueLogErrorParser.on_error do |line|
        lines << line
      end
      described_class.perform
      expect(lines.count).to eq(1)
      expect(lines).to include("E, [2013-10-06T17:01:04.194981 #28727] ERROR -- : Error line today")
    end
  end

end
