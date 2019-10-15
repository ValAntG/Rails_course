require 'rails_helper'

RSpec.describe Admin::RailwayStationsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/admin/railway_stations').to route_to('admin/railway_stations#index')
    end

    it 'routes to #show' do
      expect(get: '/admin/railway_stations/1').to route_to('admin/railway_stations#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/admin/railway_stations/new').to route_to('admin/railway_stations#new')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/railway_stations/1').to route_to('admin/railway_stations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/railway_stations/1').to route_to('admin/railway_stations#update', id: '1')
    end
  end
end