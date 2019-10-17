class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :del_station, :add_station, :add_train]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    ActiveRecord::Base.transaction do
      @route = Route.new(name: 'name')
        if @route.save
          redirect_to [:admin, @route], notice: 'Route was successfully created.'
        else
          render :new
        end
      stations_add_route
    end
  end

  def update
    timetable_params
    if route_update
      redirect_to [:admin, @route], notice: 'Route was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  def add_station
    @add_station = update_params[:add_station_id]
    @route.railway_stations_routes.create!(railway_station_id: @add_station, position: @route.railway_stations_routes.size)
    redirect_to edit_admin_route_path
  end

  def del_station
    @del_station = update_params[:del_station_id]
    @route.railway_stations_routes.find_by(railway_station_id: @del_station).delete
    redirect_to edit_admin_route_path
  end

  def add_train
    @add_train = update_params[:add_train_id]
    Train.find(@add_train).update(route_id: @route.id)
    redirect_to edit_admin_route_path
  end

  private

  def stations_add_route
    @route_stations = route_params[:railway_stations_ids].reject(&:blank?)
    @route_stations.each_with_index do |station, position|
      @route.railway_stations_routes.create!(railway_station_id: station, route_id: @route.id, position: position)
    end
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, railway_stations_ids: [])
  end

  def timetable_params
    params.require(:route).permit(:name, :id, :add_station_id, :del_station_id, railway_stations_route: {})
  end

  def update_params
    params.permit(:id, :add_station_id, :del_station_id, :add_train_id)
  end

  def route_update
    @route.update(name: timetable_params[:name])
    timetable_params[:railway_stations_route].each do |rsr|
      RailwayStationsRoute.find(rsr[0]).update(rsr[1])
    end
  end
end
