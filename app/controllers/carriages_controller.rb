class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage.becomes(Carriage)
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.becomes(Carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private
    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      params.require(:carriage).permit(:train_id, :type, :place_botton, :place_top, :place_botton_side, :place_top_side,
                                        :seat)
    end
end
