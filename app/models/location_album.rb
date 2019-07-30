# frozen_string_literal: true

class LocationAlbum
  def initialize(images)
    @images = images[:photos][:photo]
  end

  def background_images
    images.map do |image|
      {
        alt: image[:title],
        url: "https://www.flickr.com/photos/#{image[:owner]}/#{image[:id]}"
      }
    end
  end

  private

  attr_reader :images
end
