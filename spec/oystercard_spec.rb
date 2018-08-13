require 'oystercard'

describe Oystercard do

  describe "#Initialize" do

    it "@balance - subject should respond to an instance variable @balance" do
      expect(subject).to respond_to(:balance)
    end

    it "@balance - has a balance of zero" do
      expect(subject.balance).to eq(0)
    end
  end

end
