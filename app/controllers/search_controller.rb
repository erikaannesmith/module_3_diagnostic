class SearchController < ApplicationController

  def index
    @stations = Station.all_by_zipcode(params[:zipcode]).first(10)
  end

end

