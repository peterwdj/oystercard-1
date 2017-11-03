class JourneyLog
  attr_reader :in_journey
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history

  def initialize(journey = Journey.new)
    @journey = journey
    @in_journey = false
    @journey_history = []
  end

  def begin_journey(station)
    @journey.start_journey(station)
    add_new_journey
    in_journey?
  end

  def finish_journey(station)
    @journey.end_journey(station)
    complete_journey
  end

  private

  def update_journey_history
    in_journey? ? update_exit : add_no_entry
  end

  def in_journey?
    @journey.entry_station != nil ? @in_journey = true : @in_journey = false
  end

  def update_exit
    @journey_history.last[:exit_station] = @journey.exit_station
  end

  def add_no_entry
    @journey_history << {
      entry_station: nil,
      exit_station: @journey.exit_station
    }
  end

  def add_new_journey
    @journey_history << {
      entry_station: @journey.entry_station,
      exit_station: nil
    }
  end

  def reset_journey
    @journey.reset_journey
  end

  def complete_journey
    update_journey_history
    reset_journey
    in_journey?
  end
end
