class Journey
attr_reader :entry
attr_reader :exit

  def initialize
    @entry = nil
    @exit = nil
  end

  def current_journey(entry)
    @entry = entry
  end
end
