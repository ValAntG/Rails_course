class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

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
          redirect_to [:admin, @route]
        else
          render :new
        end
      stations_add_route

    end
  end

  def update
    ActiveRecord::Base.transaction do
      if @route.update(name: 'name')
        redirect_to [:admin, @route]
      else
        render :edit
      end
      @route.railway_stations_routes.clear
      stations_add_route
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def stations_add_route
    @route_stations = route_params[:railway_stations_ids].reject!(&:empty?)
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
end
