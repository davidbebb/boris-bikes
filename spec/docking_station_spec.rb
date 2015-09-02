

require "./lib/docking_station.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "responds to a request to release a bike" do
    expect(subject.release_bike).to be_an_instance_of Bike
  end
  it "responds to a request to release a bike" do
    expect(subject.release_bike.working?).to be_truthy

  end


end



# describe DockingStation do
#   it "returns a Docing Station object" do
#     expect(DockingStation.new()).to be_an_instance_of DockingStation
#   end
#   it "responds to a request to release a bike" do
#     expect(subject.release_bike).to be_an_instance_of Bike
#   end
#   it "responds to a request to release a bike" do
#   expect(subject.release_bike.working?).to be_truthy
#   end
# end