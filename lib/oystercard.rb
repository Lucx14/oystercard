class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Max limit of £#{MAX_LIMIT} reached on card" if @balance >= MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough money on card!" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
