class NrelService

  def initialize
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = "BmEoGTxrar0Fc82jBh5uC5ZKTnTdzeEI2MjqyNlL"
      faraday.adapter Faraday.default_adapter
    end
  end

  def all_by_zip(zipcode)
    get_json("/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&radius=6&fuel_type=ELEC,LPG")
  end

  private
    attr_reader :conn

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

end