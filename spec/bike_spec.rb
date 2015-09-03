require "./lib/bike.rb"

describe Bike do

  it 'bike is working' do
    expect(subject.instance_variable_get(:@working)).to eql true
  end

  it 'set bike not working' do
    subject.not_working
    expect(subject.instance_variable_get(:@working)).to eql false
  end

  it { is_expected.to respond_to :not_working }

end
