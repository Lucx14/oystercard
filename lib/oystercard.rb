class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90

  def initialize
    @balance = 0
  end


  def top_up(amount)
    raise "Max limit of £#{MAX_LIMIT} reached on card" if @balance >= MAX_LIMIT
    @balance += amount
  end




end
