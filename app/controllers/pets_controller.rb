class PetsController < ApplicationController

  def index
    @pets = Pet.all
    render template: "pets/index"
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render template: "pets/show"
  end

  def create
    @pet = Pet.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
    )
    if @pet.save
      render template: "pets/show"
    else
      render json: {errors: @pet.errors.full_messages}
    end
  end
end
