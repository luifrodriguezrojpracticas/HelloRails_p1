class CarsController < ApplicationController
    before_action :set_car, only: [:show, :update, :destroy]

    def index
        @car = Car.all
        render json: @car
    end

    def show
        begin
            render json: @car
        rescue ActiveRecord::RecordNotFound => e    
            render json: {error: e.to_s}, status: :not_found
        end
    end

    def destroy
        @car.destroy
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            render json: @car
        else
            render json:@car.errors, status: :unprocessable_entity
        end
    end

    def update
        if @car.update(car_params)
            render json: @car
        else
            render json:@car.errors, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
        @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
        params1 = ActionController::Parameters.new({
                car: {
                name: params.fetch("name"),
                document: params.fetch("document"),
                plate: params.fetch("plate")
            }
        })
        params1.require(:car).permit(:name, :document, :plate)
    end
end
