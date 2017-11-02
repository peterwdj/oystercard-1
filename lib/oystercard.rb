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
  PENALTY_FARE = 6

  def initialize(balance = DEFAULT_BALANCE, journey = Journey.new)
    @balance = balance
    @journey = journey
    @in_journey = in_journey?
    @journey_history = []
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    increment(amount)
  end

  def touch_in(station = nil)
    raise "Sorry insufficient funds available" if insufficient_funds?
    @journey.start_journey(station)
    in_journey?
  end

  def touch_out(station = nil)
    deduct(MINIMUM_FARE)
    @journey.end_journey(station)
    update_journey_history
    reset_journey
    in_journey?
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def in_journey?
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
    @journey_history << { entry_station: journey.entry_station, exit_station: journey.exit_station }
  end

  def reset_journey
    @journey.reset_journey
  end
------------------------------------------------
  def fare?
    in_journey? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
  end

  def in_penalty_fare?
    @journey_history.last.fetch(:exit_station).nil?
    deduct(PENALTY_FARE)
  end

  def out_penalty_fare?
    @journey_history.last.fetch(:entry_station).nil? ? deduct(PENALTY_FARE) : deduct(MINIMUM_FARE)
  end

end
