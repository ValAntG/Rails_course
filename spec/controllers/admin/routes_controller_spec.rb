require 'rails_helper'

RSpec.describe Admin::RoutesController, type: :controller do
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
    it 'success and render to index page in routes (status)' do
      check_admin
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'success and render to index page in routes' do
      check_admin
      get :index
      expect(response).to render_template :index
    end

    it 'not index page a routes without authorization' do
      get :index
      expect(response).to have_http_status(:found)
    end

    it 'not index page a routes user without admin rights' do
      check_user
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #show' do
    it 'success and render to edit page (status)' do
      check_admin
      Route.create(name: 'Kiev-Kharkiv')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:ok)
    end

    it 'success and render to edit page' do
      check_admin
      Route.create(name: 'Kiev-Kharkiv')
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end

    it 'not show a routes without authorization' do
      Route.create(name: 'Kiev-Kharkiv')
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:found)
    end

    it 'not show a routes user without admin rights' do
      Route.create(name: 'Kiev-Kharkiv')
      check_user
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST #create' do
    it 'not creating a routes without authorization (status)' do
      params = { route: { name: 'Kiev-Kharkiv' } }
      post(:create, params: params)
      expect(response).to have_http_status(:found)
    end

    it 'not creating a routes without authorization' do
      params = { route: { name: 'Kiev-Kharkiv' } }
      expect { post(:create, params: params) }.not_to change(Route, :count)
    end

    it 'not show a routes user without admin rights (status)' do
      check_user
      params = { route: { name: 'Kiev-Kharkiv' } }
      post(:create, params: params)
      expect(response).to have_http_status(:found)
    end

    it 'not show a routes user without admin rights' do
      check_user
      params = { route: { name: 'Kiev-Kharkiv' } }
      expect { post(:create, params: params) }.not_to change(Route, :count)
    end

    it 'success create routes (increase in quantity)' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      RailwayStation.create(title: 'Kharkiv')
      params = { route: { railway_stations_ids: [1, 2] } }
      expect { post(:create, params: params) }.to change(Route, :count).by(1)
    end

    it 'success create routes (naming routes)' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      RailwayStation.create(title: 'Kharkiv')
      params = { route: { railway_stations_ids: [1, 2] } }
      post(:create, params: params)
      expect(Route.last.name).to eq('Kiev - Kharkiv')
    end

    it 'success redirect and notice messenger after create routes(notice)' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      RailwayStation.create(title: 'Kharkiv')
      params = { route: { railway_stations_ids: [1, 2] } }
      post(:create, params: params)
      expect(flash[:notice]).to eq 'Route was successfully created.'
    end

    it 'success redirect and notice messenger after create routes' do
      check_admin
      RailwayStation.create(title: 'Kiev')
      RailwayStation.create(title: 'Kharkiv')
      params = { route: { railway_stations_ids: [1, 2] } }
      post(:create, params: params)
      expect(response).to redirect_to(admin_route_path(Route.last))
    end
  end

  # describe 'PUT #update' do
  #   let!(:railway_station1) { RailwayStation.create(title: 'Kiev')}
  #   let!(:railway_station2) { RailwayStation.create(title: 'Kharkiv')}
  #   let!(:route) { Route.create(name: 'Kiev - Kharkiv')}
  #   it 'should update routes' do
  #     check_admin
  #     params = { route: { railway_stations_ids: ['2', '1'] } }
  #     expect { put(:update, params: params) }.to change { route.reload.name }
  #                                            .from('Kiev - Kharkiv').to('Kharkiv - Kiev')
  #   end

  #   it 'should not updating a routes without authorization' do
  #     params = { id: route.id, route: {title: 'Kharkiv' }}
  #     put(:update, params: params)
  #     expect { put(:update, params: params) }.not_to change { route.reload.title }
  #     expect(response).to have_http_status(302)
  #   end

  #   it 'should not show a routes user without admin rights' do
  #     check_user
  #     params = { id: route.id, route: {title: 'Kharkiv' }}
  #     put(:update, params: params)
  #     expect(response).to have_http_status(302)
  #   end
  # end
end
