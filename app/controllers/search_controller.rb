class SearchController < ApplicationController

  def index
    # byebug

    @stations = Station.all_by_zipcode(zip_code: params[:q])
    # @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG") do |faraday|
    #   faraday.headers["X-API-KEY"] = "BmEoGTxrar0Fc82jBh5uC5ZKTnTdzeEI2MjqyNlL"
    #   faraday.adapter Faraday.default_adapter
    # end
    byebug
  end

end

class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type = attributes[:fuel_type]
    @distance = attributes[:distance]
    @access_times = attributes[:access_times]
  end

  def self.all_by_zipcode(zipcode)
    faraday_helper
  end

  def self.faraday_helper
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&fuel_type=ELEC,LPG") do |faraday|
      faraday.headers["X-API-KEY"] = "BmEoGTxrar0Fc82jBh5uC5ZKTnTdzeEI2MjqyNlL"
      faraday.adapter Faraday.default_adapter
    end
  end


end