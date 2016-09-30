class CreaturesController < ApplicationController
  #display all creatures
  def index
    #get all creatures from db - save to instance variable
    @creatures = Creature.all
    #render index view
    #remember the default behavior is to render :index
  end

  def new
    @creature = Creature.new
  end

  def create
    creature = Creature.new(creature_params)

    if creature.save
      redirect_to creature_path(creature)
    end
  end

  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def update
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id)
    creature.update_attributes(creature_params)
    redirect_to creature_path(creature)
  end

  def destroy
    creature_id = params[:id]
    creature = Creature.find_by_id(creature_id)
    creature.destroy
    redirect_to creatures_path
  end

  def show
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :description)
  end
end
