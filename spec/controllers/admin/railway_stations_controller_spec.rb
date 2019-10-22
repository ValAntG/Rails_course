require 'rails_helper'

RSpec.describe Admin::RailwayStationsController, type: :controller do
  def check_admin
    user = instance_double('user', admin?: true)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  def check_user
    user = instance_double('user', admin?: false)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'success and render to index page in railway stations (status)' do
      check_admin
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'success and render to index page in railway stations' do
      check_admin
      get :index
      expect(response).to render_template :index
    end

    it 'not index page a railway stations without authorization' do
      get :index
      expect(response).to have_http_status(:found)
    end

    it 'not index page a railway stations user without admin rights' do
      check_user
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #show' do
    it 'success and render to edit page (status)' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'success and render to edit page' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end

    it 'not show a railway stations without authorization' do
      RailwayStation.create(title: 'Kiev')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:found)
    end

    it 'not show a railway stations user without admin rights' do
      RailwayStation.create(title: 'Kiev')
      check_user
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST #create' do
    it 'not creating a railway stations without authorization (status)' do
      params = { railway_station: { title: 'Kiev' } }
      post(:create, params: params)
      expect(response).to have_http_status(:found)
    end

    it 'not creating a railway stations without authorization' do
      params = { railway_station: { title: 'Kiev' } }
      expect { post(:create, params: params) }.not_to change(RailwayStation, :count)
    end

    it 'not show a railway stations user without admin rights (status)' do
      check_user
      params = { railway_station: { title: 'Kiev' } }
      post(:create, params: params)
      expect(response).to have_http_status(:found)
    end

    it 'not show a railway stations user without admin rights' do
      check_user
      params = { railway_station: { title: 'Kiev' } }
      expect { post(:create, params: params) }.not_to change(RailwayStation, :count)
    end

    it 'success create railway stations (increase in quantity)' do
      check_admin
      params = { railway_station: { title: 'Kiev' } }
      expect { post(:create, params: params) }.to change(RailwayStation, :count).by(1)
    end

    it 'success create railway stations (naming station)' do
      check_admin
      params = { railway_station: { title: 'Kiev' } }
      post(:create, params: params)
      expect(RailwayStation.last.title).to eq('Kiev')
    end

    it 'success redirect and notice messenger after create railway stations (notice)' do
      check_admin
      params = { railway_station: { title: 'Kiev' } }
      post(:create, params: params)
      expect(flash[:notice]).to eq 'Railway station was successfully created.'
    end

    it 'success redirect and notice messenger after create railway stations' do
      check_admin
      params = { railway_station: { title: 'Kiev' } }
      post(:create, params: params)
      expect(response).to redirect_to(admin_railway_station_path(RailwayStation.last))
    end
  end

  describe 'PUT #update' do
    let!(:railway_station) { RailwayStation.create(title: 'Kiev') }

    it 'update railway stations' do
      check_admin
      params = { id: railway_station.id, railway_station: { title: 'Kharkiv' } }
      expect { put(:update, params: params) }.to change { railway_station.reload.title }.from('Kiev').to('Kharkiv')
    end

    it 'not updating a railway stations without authorization' do
      params = { id: railway_station.id, railway_station: { title: 'Kharkiv' } }
      put(:update, params: params)
      expect { put(:update, params: params) }.not_to(change { railway_station.reload.title })
    end

    it 'not updating a railway stations without authorization (status)' do
      params = { id: railway_station.id, railway_station: { title: 'Kharkiv' } }
      put(:update, params: params)
      expect(response).to have_http_status(:found)
    end

    it 'not show a railway stations user without admin rights' do
      check_user
      params = { id: railway_station.id, railway_station: { title: 'Kharkiv' } }
      put(:update, params: params)
      expect(response).to have_http_status(:found)
    end
  end
end
