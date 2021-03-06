class Journey
  attr_reader :journey, :entry_station, :exit_station

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

  private

  def add_journey
    [{ @entry_station => @exit_station }]
  end

end
