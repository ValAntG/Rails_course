class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket
    ticket = Ticket.find(params[:id])
    train = Train.find(RailwayStationsRoute.find(ticket.rsr_first_id).train_id)
    station_first = RailwayStation.find(RailwayStationsRoute.find(ticket.rsr_first_id).railway_station_id)
    station_last = RailwayStation.find(RailwayStationsRoute.find(ticket.rsr_last_id).railway_station_id)
    time_first = RailwayStationsRoute.find(ticket.rsr_first_id).departure
    time_last = RailwayStationsRoute.find(ticket.rsr_last_id).arrival
    @ticket_info = {train: train.name, station_first: station_first.title, station_last: station_last.title,
                    time_first: time_first, time_last: time_last}
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    user_id = {user_id: 1}
    @ticket = Ticket.new((train_params).merge(ticket_params).merge(user_id))
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'ticket was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'ticket was successfully destroyed.' }
    end
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:last_name, :first_name, :father_name, :passport_series, :passport_numbers)
  end

  def train_params
    first_station = RailwayStationsRoute.find(params[:ticket_rsr_first])
    last_station = RailwayStationsRoute.find(params[:ticket_rsr_first])
    train_ticket = { rsr_first_id: first_station.id, rsr_last_id: last_station.id}
  end
end
