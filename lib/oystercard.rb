class Oystercard

  attr_reader :balance, :in_journey

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Max limit of £#{MAX_LIMIT} reached on card" if @balance >= MAX_LIMIT
    @balance += amount
  end


  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Not enough money on card!" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
