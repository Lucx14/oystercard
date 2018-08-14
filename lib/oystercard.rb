class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station


  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = ""
    @exit_station = ""
  end

  def top_up(amount)
    raise "Max limit of £#{MAX_LIMIT} reached on card" if @balance >= MAX_LIMIT
    @balance += amount
  end


  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Not enough money on card!" if @balance < MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @in_journey = false
    @exit_station = station
    


    @entry_station = nil

  end

  # def entry_station
  #     @entry_station
  # end



  private

  def deduct(amount)
    @balance -= amount
  end

end
