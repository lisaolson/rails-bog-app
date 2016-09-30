class CreaturesController < ApplicationController
  #display all creatures
  def index
    #get all creatures from db - save to instance variable
    @creatures = Creature.all
    #render index view
    #remember the default behavior is to render :index
  end

  def new

  end
end
