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
#    it ".top_up - subject should respond to method with 1 argument" do
#      expect(subject).to respond_to(:top_up).with(1).argument
#    end
    it ".top_up - method should change the balance by the amount of the argument" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by(5)
    end
    it ".top_up - card has max limit of £90" do
      subject.top_up(Oystercard::MAX_LIMIT)
      expect{ subject.top_up(1) }.to raise_error "Max limit of £#{Oystercard::MAX_LIMIT} reached on card"
    end
  end


  describe "#deduct" do
#    it ".deduct - subject should respond to method with 1 argument" do
#      expect(subject).to respond_to(:deduct).with(1).argument
#    end
    it ".deduct - method should change the balance by the amount of the argument" do
      subject.top_up(20)
      expect{ subject.deduct(5) }.to change{ subject.balance }.by(-5)
    end
  end


  describe "#touch_in" do
    it ".touch_in - subject should respond to this method" do
      expect(subject).to respond_to(:touch_in)
    end
    it ".touch_in - should change in_journey status to true" do
      subject.touch_in
      expect(subject.in_journey?).to be(true)
    end
  end

  describe "#touch_out" do
    it ".touch_out - subject should respond to this method" do
      expect(subject).to respond_to(:touch_out)
    end
    it ".touch_out - should change in_journey status to false" do
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end


  describe "#in_journey?" do
    it ".in_journey? - subject should respond to this method" do
      expect(subject).to respond_to(:in_journey?)
    end
    it ".in_journey? - is initially false (not in journey)" do
      expect(subject).not_to be_in_journey
    end
  end
end
