# frozen_string_literal: true

class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_type :background_image

  attributes :alt, :url
end
