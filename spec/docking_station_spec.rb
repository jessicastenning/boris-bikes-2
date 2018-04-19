require 'docking_station'

describe DockingStation do
  bikes = Bike.new
  DEFAULT_CAPACITY = 20

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'returns a working bike' do
      subject.dock(bikes)
      expect(subject.release_bike).to be_working
  end

  it 'docks something' do
    expect(subject.dock(bikes)).to include bikes
  end

  it 'returns docked bikes' do
    subject.dock(bikes)
    expect(subject.bikes).to include bikes
  end

  describe '#dock(bike)' do
    it 'raises error if docking station is full' do
      DEFAULT_CAPACITY.times { subject.dock(bikes) }
      expect { subject.dock(bikes) }.to raise_error 'docking station is full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock(bikes)
      expect(subject.release_bike).to eq bikes
    end

    it 'raises error if no bikes available' do
        expect { subject.release_bike }.to raise_error 'no bikes available'
    end
  end
end
