class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end
  
  def show
    @shelter = Shelter.find(params[:id])
  end

  #Might consider doing shelter_params method
  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end



end
