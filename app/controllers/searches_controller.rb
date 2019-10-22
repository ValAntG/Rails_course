class SearchesController < ApplicationController
  before_action :authenticate_user!
  def show
    search_route
    @station_first = RailwayStation.find(params[:station_first_id])
    @station_last = RailwayStation.find(params[:station_last_id])
  end

  def new
    @stations = RailwayStation.all
  end

  def edit; end

  def create; end

  def search_route
    @search_rsr = SearchRouteService.search(params[:station_first_id], params[:station_last_id])
  end
end
