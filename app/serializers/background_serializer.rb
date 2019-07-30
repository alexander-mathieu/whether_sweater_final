# frozen_string_literal: true

class BackgroundSerializer
  def self.serialize(location_album)
    {
      data: {
        background_images: location_album.background_images
      }
    }
  end
end
