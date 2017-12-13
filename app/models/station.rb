class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})
  # byebug
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end

  def self.all_by_zipcode(zipcode)
    nrel_service.all_by_zip(zipcode)[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end

  private

  def self.nrel_service
    NrelService.new
  end

end