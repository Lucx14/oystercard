class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end


  def top_up(amount)
    raise "Max limit reached on card" if @balance >= 90
    @balance += amount
  end




end
