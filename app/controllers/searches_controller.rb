class SearchesController < ApplicationController
  def show
  end

  def new
    # @station_first = RailwayStation.all.find_by(title: station_first)
    # @search = Seaarch.new
  end

  def edit
  end

  # def create
  #   @carriage = @train.carriages.new(carriage_params)
  #   if @carriage.save
  #     redirect_to train_carriages_path
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   if @carriage.update(carriage_params)
  #     redirect_to @carriage.becomes(Carriage)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @carriage.destroy
  #   redirect_to carriages_path
  # end

  # private
  # def set_train
  #   @train = Train.find(params[:train_id])
  # end

  # def search_params
  #     params.require(:carriage).permit(:train_id, :type, :place_botton, :place_top, :place_botton_side, :place_top_side,
  #                                       :seat)
  # end
end
