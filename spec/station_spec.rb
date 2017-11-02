require 'station'

describe Station do

  it "Station has a name" do
    station = Station.new("Kings Cross", 1)
    expect(station.name).not_to be_empty
  end

  it "Station has a zone" do
    station = Station.new("Kings Cross", 1)
    expect(station.zone).to eq 1
  end
  
end
