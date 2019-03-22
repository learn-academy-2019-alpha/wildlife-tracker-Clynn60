class SightingsController < ApplicationController
    def index
        @sightings = Animal.sightings.all
    end
    
    def new
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.new
    end
    
    def update
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.(params[:id])

        if @sighting.update(post_params)
            redirect_to @sighting
        else
            render 'edit'
        end
    end
    
    def edit
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.(params[:id])
    end
    
    def create
        @sighting = Sighting.new(sighting_params)
        @animal = @sighting.animal
        if @sighting.save
            redirect_to root_path
        else
            render action: :new
        end
    end


    
    private
    
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :time, :latitude, :longitude)
    end
end