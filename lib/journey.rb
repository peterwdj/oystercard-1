class Journey
  attr_reader :journey, :entry_station, :exit_station, :fare

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey = []
  end

  def current_journey(entry_station, exit_station)
    start_journey(entry_station)
    end_journey(exit_station)
    @journey = add_journey
    reset_journey
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def reset_journey
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    calculate_fare
  end

  private

  def add_journey
    [{ @entry_station => @exit_station }]
  end

  def calculate_fare
    p @oystercard.journey_log
    journey_to_calculate = @journey_log.journey_history.last
    if journey_to_calculate.entry_station != nil && journey_to_calculate.exit_station != nil
      1 + (journey_to_calculate.entry_station.zone - journey_to_calculate.exit_station.zone).abs
    end
  end

end
