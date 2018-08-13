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

  describe "#top_up" do

    it ".top_up - subject should respond to method with 1 argument" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it ".top_up - method should change the balance by the amount of the argument" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by(5)
    end

    it ".top_up - card has max limit of £90" do
      subject.top_up(90)
      expect{ subject.top_up(1) }.to raise_error "Max limit of £#{Oystercard::MAX_LIMIT} reached on card"
    end


  end

end
