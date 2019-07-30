# frozen_string_literal: true

class BackgroundSerializer
  def self.serialize(background_images)
    {
      data: {
        background_images:
          background_images.map do |image|
            {
              alt: image[:title],
              url: "https://www.flickr.com/photos/#{image[:owner]}/#{image[:id]}"
            }
          end
      }
    }
  end
end
