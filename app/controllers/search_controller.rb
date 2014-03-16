class SearchController < ApplicationController
  def index

    render "/cars/index"
  end

  def cars
    page = params[:page]
    str = params["q"].to_s.strip
    @page_title = "查找车型#{str}"

    @cars = Car.search_name(str).page(page)
    render "/cars/index"
  end
end
