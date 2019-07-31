# frozen_string_literal: true

class ImageHoarderWorker
  include Sidekiq::Worker

  def perform
    top_20_cities.each do |city|
      city_params = { location: city }
      background_facade = BackgroundFacade.new(city_params)
      background_facade.location_images
    end
  end

  private

  def top_20_cities
    ['new york, ny', 'los angeles, ca', 'chicago, il', 'houston, tx',
    'philadelphia, pa', 'pheonix, az', 'san antonio, tx', 'san diego, ca',
    'dallas, tx', 'san jose, ca', 'austin, tx', 'jacksonville, fl',
    'san francisco, ca', 'indianapololis, in', 'columbus, oh', 'fort worth, tx',
    'charlotte, nc', 'detroit, mi', 'el paso, tx', 'seattle, wa']
  end
end
