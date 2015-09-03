

require "./lib/docking_station.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock_bike }
  it { is_expected.to respond_to :list_broken_bikes }
  it { is_expected.to respond_to :change_capacity }


  it "releases Bike when release called" do
    bike = double(:bike, working?: true)
    subject.dock_bike(bike)
    expect(subject.release_bike(bike)).to be bike
  end

  it "releases Bike when release called" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike(bike)).to be_an_instance_of Bike
  end

  it "returns error when no bikes avaliable" do
    expect{subject.release_bike(double :bike)}.to raise_error 'No bikes here'
  end

  it "adds bike to docking station" do
    bike = double :bike
    subject.dock_bike(bike)
    expect(subject.instance_variable_get(:@bike_array).length).to equal 1
  end

  it "returns error when no space for bikes avaliable" do
    bike = double :bike
    subject.instance_variable_get(:@capacity).times {subject.dock_bike bike}
    expect{subject.dock_bike(bike)}.to raise_error 'too many bikes here'
  end

  it "change dock station capcity" do
    subject.change_capacity(5)
    expect(subject.instance_variable_get(:@capacity)).to equal 5
  end

  it "Raise error if attempt to release broken bike" do
    bike = double :bike, working?: false
    subject.dock_bike(bike)
    expect{subject.release_bike(bike)}.to raise_error 'bike is broken'
  end

  it "list broken bikes" do
    bike_1=double :bike_1, working?: false
    bike_2=double :bike_2, working?: false
    bike_3=double :bike_3, working?: true
    subject.dock_bike(bike_1)
    subject.dock_bike(bike_2)
    subject.dock_bike(bike_3)
    subject.list_broken_bikes
    expect(subject.instance_variable_get(:@broken_bikes).all?{|bike| bike.working? == false}).to be true
  end


end
