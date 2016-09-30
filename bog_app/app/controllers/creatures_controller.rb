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
    creature_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creatures_path
    end
  end
end
