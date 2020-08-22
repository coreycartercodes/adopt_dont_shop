class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    Pet.create!(pet_params)
    redirect_to "/pets/"
  end

  def pet_params
    params.permit(:image, :name, :age, :sex, :shelter_id)
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({image: params[:image], name: params[:name], age: params[:age], sex: params[:sex], shelter_id: params[:shelter_id]})
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  #
  def destroy
    pet.destroy(params[:id])
    redirect_to '/pets'
  end


end
