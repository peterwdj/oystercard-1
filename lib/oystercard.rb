class Oystercard

  attr_reader :balance
  attr_reader :in_journey
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history
  attr_reader :journey

  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE, journey = Journey.new)
    @balance = balance
    @journey = journey
    @in_journey = in_journey?
    #@entry_station = nil
    # @exit_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    increment(amount)
  end

  def touch_in(station)
    raise "Sorry insufficient funds available" if insufficient_funds?
    @journey.start_journey(station)
    in_journey?
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    add_exit_station(station)
    update_journey_history
    reset_entry_station
    in_journey?
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def in_journey?
    p "ENTRY STATION", @journey.entry_station
    @journey.entry_station != nil ? @in_journey = true : @in_journey = false
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end

  def increment(amount)
    @balance += amount
  end

  def update_journey_history
    @journey_history << { journey.entry_station => @exit_station }
  end

  def add_entry_station(station)
    @entry_station = station
  end

  def add_exit_station(station)
    @exit_station = station
  end

  def reset_entry_station
    @journey.entry_station = nil
  end

end
