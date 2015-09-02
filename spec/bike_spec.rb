

require "./lib/bike.rb"

describe Bike do
  it { is_expected.to respond_to :working? }
  it 'new bike is working?'do
     expect(subject.working?).to be_truthy
  end
end