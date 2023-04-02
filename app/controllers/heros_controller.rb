class HerosController < ApplicationController

    def index
        render json: Hero.all, only: [:name, :super_name]
    end

    def show
        hero = Hero.find(params[:id])
        render json: hero, only: [:name, :super_name], include: ["powers"]
    end

end
