module Admin
  class CarriagesController < Admin::BaseController
    before_action :load_carriage, only: [:show, :edit, :update, :destroy]
    before_action :load_train, only: [:index, :create, :new]

    def index
      @carriages = @train.carriages.all
    end

    def show; end

    def new
      @carriage = @train.carriages.new
    end

    def edit
      @carriage = Carriage.find(params[:id])
    end

    def create
      @carriage = @train.carriages.new(carriage_params)
      if @carriage.save
        redirect_to [:admin, @carriage.becomes(Carriage)], notice: 'Carriage was successfully created.'
      else
        render :new
      end
    end

    def update
      if @carriage.update(carriage_params)
        redirect_to [:admin, @carriage.becomes(Carriage)], notice: 'Carriage was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @carriage.destroy
      redirect_to carriages_path
    end

    private

    def load_train
      @train = Train.find(params[:train_id])
    end

    def load_carriage
      @carriage = Carriage.find(params[:id])
    end

    def carriage_params
      CarriageNilPlace.nil_place(params.require(:carriage)
            .permit(:train_id, :type, :place_botton, :place_top, :place_botton_side, :place_top_side, :seat))
    end
  end
end
