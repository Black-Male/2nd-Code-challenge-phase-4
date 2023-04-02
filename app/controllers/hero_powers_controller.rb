class HeroPowersController < ApplicationController
    
    def index
        render json: HeroPower.all, except: [:created_at, :updated_at], status: 200
    end

    def create
        item = HeroPower.create(my_params)
        if item.valid?
            render json: item.hero, include: ["powers"], except: [:created_at, :updated_at]
            # app_response(status: :created, data: item.hero)
        else
            app_response(status: :unprocessable_entity, data: item.errors, message: 'failed')
        end
    end

    private 

    def my_params
        params.permit(:strength, :power_id, :hero_id)
    end
end
