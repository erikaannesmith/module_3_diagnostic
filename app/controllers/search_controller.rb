class SearchController < ApplicationController

  def index
    @stations = Station.all_by_zipcode(zip_code: params[:q])
  end

end

