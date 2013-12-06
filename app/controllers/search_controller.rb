class SearchController < ApplicationController
  def index

    render "/cars/index"
  end

  def cars
    @cars = Car.search_name(params["q"].to_s.strip)
    render "/cars/index"
  end
end
