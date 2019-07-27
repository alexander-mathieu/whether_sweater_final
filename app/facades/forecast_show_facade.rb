class ForecastShowFacade
  def initialize(location_params)
    @location_params = location_params
  end

  def forecast
    darksky_service.retrieve_forecast(formatted_latlong)
  end

  private
  attr_reader :location_params

  def formatted_latlong
    "#{latlong[:lat]}," + "#{latlong[:lng]}"
  end

  def latlong
    @latlong ||= google_maps_service.retrieve_latlong(location_params)
  end

  def google_maps_service
    @google_maps_service ||= GoogleMapsService.new
  end

  def darksky_service
    @darksky_service ||= DarkskyService.new
  end
end
