require 'station'
describe Station do
  subject  {described_class.new("Bank", 1)}

  describe "#zone" do
    it "returns a zone" do
      expect(subject.zone).to eq(1)
    end
  end

  describe "#name" do
    it "returns the station name" do
      expect(subject.name).to eq("Bank")
    end
  end
end
