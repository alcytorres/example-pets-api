class PetsController < ApplicationController

  def index
    p "current_user"
    p current_user.id
    p "current_user"
    @pets = Pet.all
    render template: "pets/index"
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render template: "pets/show"
  end

  def create
    p "current_user"
    p current_user.id
    p "current_user"

    @pet = Pet.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user.id
    )
    if @pet.save
      render template: "pets/show"
    else
      render json: {errors: @pet.errors.full_messages}
    end
  end
end

