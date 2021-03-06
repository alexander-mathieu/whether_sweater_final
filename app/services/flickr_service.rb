# frozen_string_literal: true

class FlickrService
  def initialize(lat, long, tags = 'downtown,skyline')
    @lat = lat
    @long = long
    @tags = tags
  end

  def retrieve_images
    params = {
      method: 'flickr.photos.search',
      sort: 'interestingness-desc',
      tags: tags,
      lat: lat,
      lon: long,
      content_type: 1,
      safe_search: 1,
      per_page: 10
    }

    parse_response('', params)[:photos][:photo]
  end

  private

  attr_reader :lat, :long, :tags

  def parse_response(url, params = {})
    response = connection.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new('https://www.flickr.com/services/rest') do |f|
      f.params['api_key'] = ENV['FLICKR_API_KEY']
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
      f.adapter Faraday.default_adapter
    end
  end
end
