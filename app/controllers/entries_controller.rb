class EntriesController < ApplicationController
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place= Place.find_by({"id" => @entry["place_id"]})
    # render entry/show view with details about entry
  end

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render entry/new view with new entry form
  end

  def create
    # start with a new entry
    @entry = Entry.new

    # assign user-entered form data to entry's columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]

    # assign relationship between entry and place
    @entry["place_id"] = params["place_id"]

    # save entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

end

