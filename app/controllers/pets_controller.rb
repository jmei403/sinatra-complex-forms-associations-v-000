class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if @pet.owner_id
      @owner = Owner.find_by_id(:id)
    else
      @owner = Owner.create(name: params[:owner_name])
      @owner.pets << @pet
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])

<<<<<<< HEAD
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    # binding.pry
    @pet.save
=======
    if !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
    end
    binding.pry
>>>>>>> ae139000677f2efe393cd3cbda16f9ca0ebada9b
    redirect to "pets/#{@pet.id}"
  end
end
