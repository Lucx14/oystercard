### Makers Academy - Week 2
# Oystercard challenge

### Description

Over the course of 1 week our cohort worked in pairs rotating each day to work to satisfy the below user stories.

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```


### Using my application

* Download the source code `$ git clone`
* In the command line use a Repl like IRB or pry
* interact with the program with some simple commands example below


```

[1] pry(main)> require './lib/oystercard.rb'
=> true
[2] pry(main)> require './lib/journey.rb'
=> false
[3] pry(main)> require './lib/station.rb'
=> true
[4] pry(main)> my_card = Oystercard.new
=> #<Oystercard:0x00007f902343ed50 @balance=0, @journeys=[]>
[5] pry(main)> my_card.balance
=> 0
[6] pry(main)> my_card.top_up(90)
=> 90
[7] pry(main)> my_card.in_journey
=> nil
[8] pry(main)> euston = Station.new('Euston', 1)
=> #<Station:0x00007f90235d40e8 @name="Euston", @zone=1>
[9] pry(main)> camden = Station.new('camden', 2)
=> #<Station:0x00007f902356ec98 @name="camden", @zone=2>
[10] pry(main)> my_card.touch_in(euston)
=> [#<Journey:0x00007f90234c4108 @entry_s=#<Station:0x00007f90235d40e8 @name="Euston", @zone=1>>]
[11] pry(main)> my_card.touch_out(camden)
=> #<Station:0x00007f902356ec98 @name="camden", @zone=2>
[12] pry(main)> my_card.balance
=> 89

```



### Approach

* The focus of this project was writing Test driven code and working with objects while continuing to get used to pair programming. A new concept introduced this week was dependency injection so understanding this concept became a big part of this project. We also were introduced to mocks and doubles in testing and so those were incorporated into the testing files.


### Project file structure

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── featuretest.rb
├── lib
│   ├── journey.rb
│   ├── oystercard.rb
│   └── station.rb
└── spec
    ├── feature_spec.rb
    ├── journey_spec.rb
    ├── oystercard_spec.rb
    ├── spec_helper.rb
    └── station_spec.rb

2 directories, 12 files

```


### Running tests

* Within the route of the directory, run `$ rspec` to run the tests and see the results in the command line


```
Feature tests
  Station class features
    Station class can tell us the zone
    Station class can tell us the name
  Oystercard features
    shows the journeys
    deducts a penalty fare if user fails to touch in
    deducts a penalty fare if user fails to touch out

Journey
  allows user to see the entry station
  allows user to see the entry station

Oystercard
  #Initialize
    @balance - has a balance of zero
    @journeys - initializes with an empty array
  #top_up
    .top_up - method should change the balance by the amount of the argument
    .top_up - card has max limit of £90
  #touch_in
    Card is topped up first
      .touch_in - should remember the entry station
      charges a penalty if no touch out
    Card is not topped up first
      .touch_in - should raise error if balance is less than £1
  #touch_out
    Card is topped up
      charges a penalty if no touch in
    Card is topped up and user touches in then touches out
      .touch_out - creates a hash of the journey
    Card is topped up and user touches in
      .touch_out - your card should be charged when you touch out

Station
  #zone
    returns a zone
  #name
    returns the station name

Finished in 0.01308 seconds (files took 0.1684 seconds to load)
19 examples, 0 failures

```
