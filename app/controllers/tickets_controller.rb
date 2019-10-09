class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    current_user.admin? ? @tickets = Ticket.all : @tickets = current_user.tickets
  end

  def show
    train = @ticket.rsr_first.route.train
    station_first = @ticket.rsr_first.railway_station
    station_last = @ticket.rsr_last.railway_station
    time_first = @ticket.rsr_first.departure
    time_last = @ticket.rsr_last.arrival
    @ticket_info = {train: train.name, station_first: station_first.title, station_last: station_last.title,
                    time_first: time_first, time_last: time_last}
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    user_id = {user_id: current_user[:id] }
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
    last_station = RailwayStationsRoute.find(params[:ticket_rsr_last])
    train_ticket = { rsr_first_id: first_station.id, rsr_last_id: last_station.id}
  end
end
