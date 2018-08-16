require_relative 'journey'

class Oystercard

  attr_reader :balance, :in_journey, :journeys

  MAX_LIMIT = 90
  MIN_FARE = 1
  PENALTY = 10

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Max limit of £#{MAX_LIMIT} reached on card" if @balance >= MAX_LIMIT
    @balance += amount
  end

  def touch_in(station, journey = Journey.new)
    raise "Not enough money on card!" if @balance < MIN_FARE
    unless @journeys.empty?
      if @journeys.last.exit_s == nil
        deduct(PENALTY)
      end
    end
    journey.entry_s = station
    @journeys << journey
  end

  def touch_out(station, journey = Journey.new)
    if @journeys.empty? || @journeys.last.exit_s != nil
      deduct(PENALTY)
      journey.exit_s = station
      @journeys << journey
    else
      deduct(MIN_FARE)
      @journeys.last.exit_s = station
    end
  end

  # def in_journey?
  #   @journeys.last.exit_s == nil
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

end
