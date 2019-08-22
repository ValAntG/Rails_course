class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
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
      station_first_id = params[:ticket_rsr_first].to_i
      station_last_id = params[:ticket_rsr_last].to_i
      train_id = Train.find(RailwayStationsRoute.find(station_first_id).train_id).id
      # station_first = RailwayStation.find(RailwayStationsRoute.find(rsr_first).railway_station_id).title
      # station_last = RailwayStation.find(RailwayStationsRoute.find(rsr_last).railway_station_id).title
      @train_ticket = { train_id: train_id, railway_station_first_id: station_first_id, railway_station_last_id: station_last_id}
    end
end
