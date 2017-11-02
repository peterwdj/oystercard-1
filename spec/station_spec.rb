require 'station'

describe Station do

  let(:station) do
    station = Station.new("Kings Cross", 1)
  end

  it "Station has a name" do
    expect(station.name).not_to be_empty
  end

  it "Station has a zone" do
    expect(station.zone).to eq 1
  end

end
