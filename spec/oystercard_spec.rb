require 'oystercard'

describe Oystercard do

  describe "#Initialize" do
    it "@balance - has a balance of zero" do
      expect(subject.balance).to eq(0)
    end
    it "@journeys - initializes with an empty array" do
      expect(subject.journeys).to eq([])
    end
  end

  describe "#top_up" do
    it ".top_up - method should change the balance by the amount of the argument" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by(5)
    end
    it ".top_up - card has max limit of £90" do
      subject.top_up(Oystercard::MAX_LIMIT)
      expect{ subject.top_up(1) }.to raise_error "Max limit of £#{Oystercard::MAX_LIMIT} reached on card"
    end
  end


  describe "#touch_in" do
    let(:station){ double :station }
    context "Card is topped up first" do
      before {subject.top_up(Oystercard::MAX_LIMIT)}
      before { subject.touch_in(station) }
      it ".touch_in - should change in_journey status to true" do
        expect(subject.in_journey?).to be(true)
      end
      it ".touch_in - should remember the entry station" do
        expect(subject.entry_station).to eq(station)
      end
    end
    context "Card is not topped up first" do
      it ".touch_in - should raise error if balance is less than £#{Oystercard::MIN_FARE}" do
        expect{ subject.touch_in(station) }.to raise_error("Not enough money on card!")
      end
    end
  end



  describe "#touch_out" do
    before { subject.top_up(Oystercard::MAX_LIMIT) }
    before { subject.touch_in("bank") }
    context "Card is topped up and user touches in then touches out" do
      before { subject.touch_out("Moorgate") }
      it ".touch_out - should change in_journey status to false" do
        expect(subject.in_journey?).to eq(false)
      end
      it ".touch_out - testing exit_station instance var" do
        expect(subject.exit_station).to eq("Moorgate")
      end
      it ".touch_out - creates a hash of the journey" do
        expect(subject.journeys).to eq([{ "bank" => "Moorgate" }])
      end
    end
    context "Card is topped up and user touches in" do
      it ".touch_out - your card should be charged when you touch out" do
        expect{ subject.touch_out("Moorgate") }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
      end
    end
  end
end
