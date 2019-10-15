require 'rails_helper'

RSpec.describe RailwayStation, type: :model do
  describe 'validations' do
    let!(:railway_station) { RailwayStation.create(title: 'Kiev')}
    it 'should validate' do
      expect(railway_station).to be_valid
    end
  end

  describe 'not validations' do
    let!(:railway_station) { RailwayStation.create(title: '')}
    it 'should validate' do
      expect(railway_station).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:trains) }
    it { is_expected.to have_many(:routes) }
    it { is_expected.to have_many(:railway_stations_routes) }
  end
end
