class PowersController < ApplicationController
    def index
        render json: Power.all, only: [:id, :name, :description], status: 200
    end

    def show
        power = Power.find(params[:id])
        if power
            render json: power, only: [:id, :name, :description], status: 200 
        else
            render json: {error: "Power not found"}, status: :not_found
        end
    end

    
    def update
        power = Power.find(params[:id])

        if power
            result = power.update(my_params)
            render json: result, status: 200, except: [:created_at, :updated_at]

        else
            render json: {error: "Power not found"}, status: :not_found
        end
    end

    private 
    def my_params
        params.permit(:description)
    end
    
end
