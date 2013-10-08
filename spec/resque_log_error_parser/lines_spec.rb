require "spec_helper"

describe ResqueLogErrorParser::Lines do

  describe "#filter_by" do
    let(:lines) do
      described_class.new(["hello", "world", "helloworld"])
    end

    it "returns a Lines instance filtered by the given strings" do
      filtered_lines = lines.filter_by("llo", /orld/)
      expect(filtered_lines.count).to eq(1)
      expect(filtered_lines).to include("helloworld")
    end

    it "returns an instance of Lines" do
      filtered_lines = lines.filter_by(["llo"])
      expect(filtered_lines).to be_kind_of(described_class)
    end

    context "argument is an array" do
      it "filters the lines given the array elements" do
        filtered_lines = lines.filter_by(["ell", /hello/])
        expect(filtered_lines.count).to eq(2)
        expect(filtered_lines).to include("hello")
        expect(filtered_lines).to include("helloworld")
      end
    end

    context "there are no filters" do
      it "returns the original" do
        filtered_lines = lines.filter_by([])
        expect(filtered_lines).to eq(lines)
      end
    end
  end

  describe "#strip_newlines" do
    let(:lines) { described_class.new(["hello\n"]) }
    subject { lines.strip_newlines }
    it { should eq(["hello"]) }
    it { should be_kind_of(described_class) }
  end

end
