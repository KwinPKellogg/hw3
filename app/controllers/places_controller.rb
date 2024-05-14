class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
    
  def show
    # find a place
    @place = Place.find_by({ "id" => params["id"] })
    # find entries for the place
    @entries = Entry.where({ "place_id" => @place["id"] })
    # render place/show view with details about Company
  end

  def new
    # render view with new entry form
  end

  def create
    # start with a new entry
    @place = Place.new

    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]

    # save place row
    @place.save

    # redirect user
    redirect_to "/places"
  end
end
