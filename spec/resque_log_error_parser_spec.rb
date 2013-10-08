require "spec_helper"

describe ResqueLogErrorParser do

  describe ".queue=" do
    it "sets the queue on the module" do
      described_class.queue = :a
      expect(described_class.queue).to eq(:a)
      described_class.queue = :b
      expect(described_class.queue).to eq(:b)
    end
  end

  describe ".log_paths" do
    it "defaults to ['log/*.log']" do
      expect(described_class.log_paths).to eq(['log/*.log'])
    end

    context "when log_paths was set to nil" do
      it "return the default log paths" do
        described_class.log_paths = nil
        expect(described_class.log_paths).to eq(["log/*.log"])
      end
    end
  end

  describe ".log_paths=" do
    it "sets the log_paths" do
      described_class.log_paths = ["SOMETHING"]
      expect(described_class.log_paths).to eq(["SOMETHING"])
    end

    context "a non-enumerable was passed" do
      it "should wrap with an array" do
        described_class.log_paths = "SOMETHING"
        expect(described_class.log_paths).to eq(["SOMETHING"])
      end
    end
  end

  describe ".on_error" do
    let(:block) { lambda { |msg| msg } }

    it "sets the callback function" do
      described_class.on_error(&block)
      expect(described_class.error_handler).to eq(block)
    end
  end

  describe ".line_date_format" do
    it "defaults to '%Y-%m-%dT%H'" do
      expect(described_class.line_date_format).to eq('%Y-%m-%dT%H')
    end
  end

  describe ".line_filter_keys" do
    it "defaults to ['ERROR']" do
      expect(described_class.line_filter_keys).to eq(['ERROR'])
    end
  end

end
