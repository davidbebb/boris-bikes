

require "./lib/docking_station.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock_bike }


  it "releases Bike when release called" do
    subject.instance_variable_set(:@bike_array, [Bike.new])
    expect(subject.release_bike).to be_an_instance_of Bike
  end

  it "returns error when no bikes avaliable" do
    expect{subject.release_bike}.to raise_error 'No bikes here'
  end

  it "adds bike to docking station" do
    subject.dock_bike(Bike.new)
    expect(subject.instance_variable_get(:@bike_array).length).to equal 1
  end


  it "returns error when no space for bikes avaliable" do
    subject.instance_variable_get(:@capacity).times {subject.dock_bike Bike.new}
    expect{subject.dock_bike(Bike.new)}.to raise_error 'too many bikes here'
  end


end
