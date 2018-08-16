require './lib/oystercard.rb'
require './lib/station.rb'

oystercard = Oystercard.new
oystercard.top_up(90)
oystercard.touch_in(Station.new("Bank", 1), j1 = Journey.new)
oystercard.touch_out(Station.new("Camden", 2))
p oystercard.journeys
