require 'oystercard'

describe "Feature tests" do

  describe "Station class features" do
    it "Station class can tell us the zone" do
      station = Station.new("moorgate", 1)
      expect(station.zone).to eq(1)
    end
    it "Station class can tell us the name" do
      station = Station.new("moorgate", 1)
      expect(station.name).to eq("moorgate")
    end
  end

  describe "Oystercard features" do
    it "shows the journeys" do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      oystercard.touch_in(Station.new("Bank", 1), j1 = Journey.new)
      oystercard.touch_out(Station.new("Camden", 2))
      expect(oystercard.journeys).to include(j1)
    end

    it "deducts a penalty fare if user fails to touch in" do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      expect{ oystercard.touch_out(Station.new("Camden", 2)) }.to change {oystercard.balance}.by -10
    end
    it "deducts a penalty fare if user fails to touch out" do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      oystercard.touch_in(Station.new("Bank", 1), j1 = Journey.new)
      expect{ oystercard.touch_in(Station.new("Bank", 1), j1 = Journey.new) }.to change {oystercard.balance}.by -10
    end
  end

end
