class Oystercard
  attr_reader :balance, :journey_log

  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  PENALTY_FARE = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    increment(amount)
  end

  def touch_in(station = nil)
    raise "Sorry insufficient funds available" if insufficient_funds?
    touch_in_penalty?
    @journey_log.begin_journey(station)
  end

  def touch_out(station = nil)
    penalty?
    @journey_log.finish_journey(station)
    # NEED TO ADD IN HERE THE FARE DEDUCTION
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
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

  def in_journey?
    @journey_log.in_journey
  end

  def touch_in_penalty?
    deduct(PENALTY_FARE) if in_journey?
  end

  def penalty?
    deduct(PENALTY_FARE) unless in_journey?
  end
end
