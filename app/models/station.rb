class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(attributes = {})
  byebug
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type = attributes[:fuel_type]
    @distance = attributes[:distance]
    @access_times = attributes[:access_times]
  end

  def self.all_by_zipcode(zipcode)
    nrel_service.all_by_zip(zipcode).map do |raw_station|
      Station.new(raw_station)
    end
  end

  private

  def self.nrel_service
    NrelService.new
  end

 

end