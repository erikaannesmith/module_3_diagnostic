class SearchController < ApplicationController

  def index
    @stations = Station.all_by_zipcode(params[:q]).first(10)
  end

end

