class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :update_position, :add_station]

  # skip_before_action :verify_authenticity_token
  # protect_from_forgery prepend: true, with: :exception

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
    binding.pry
    if @route.railway_stations_routes.find_by(railway_station_id: params[:railway_station_id]).update(rsr_params)
      redirect_to [:admin, @route], notice: 'Route was successfully updated.'
    else
      render :edit
    end
    # ActiveRecord::Base.transaction do
    #   if @route.update(name: 'name')
    #     redirect_to [:admin, @route], notice: 'Route was successfully updated.'
    #   else
    #     render :edit
    #   end
    #   @route.railway_stations_routes.clear
    #   binding.pry
    #   stations_add_route
    # end
  end

  def update_position
    binding.pry
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position], params[:arrival], params[:departure])
    redirect_to [:admin, @route]
  end

  def add_station
    @add_station = add_station_params[:railway_stations_id]
    @route.railway_stations_routes.create!(railway_station_id: @add_station, route_id: @route.id, position: @route.railway_stations_routes.size)
    redirect_to [:admin, @route]
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  # def destroy_station_in_route(position)
  #   destroy_station(position)
  #   redirect_to [:admin, @route]
  # end

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

  def add_station_params
    params.require(:route).permit(:name, :railway_stations_id)
  end

  # def del_station_params
  #   params.require(:route).permit(:name, :railway_stations_id)
  # end

  def rsr_params
    params.permit(:position, :arrival, :departure, :route_id, :railway_station_id)
  end
end
