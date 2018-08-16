require 'oystercard'

describe "Feature tests" do


  it "Station class can tell us the zone" do
    station = Station.new("moorgate", 1)
    expect(station.zone).to eq(1)
  end
  it "Station class can tell us the name" do
    station = Station.new("moorgate", 1)
    expect(station.name).to eq("moorgate")
  end
end
