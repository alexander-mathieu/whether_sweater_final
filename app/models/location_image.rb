# frozen_string_literal: true

class LocationImage
  attr_reader :id, :alt, :url

  def initialize(image)
    @id = nil
    @alt = image[:title]
    @url = "https://www.flickr.com/photos/#{image[:owner]}/#{image[:id]}"
  end
end
