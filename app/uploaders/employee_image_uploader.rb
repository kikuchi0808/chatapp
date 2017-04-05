# frozen_string_literal: true

class EmployeeImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fill: [200, 200] # For retina
  end

  def fog_public
    false
  end

  def content_type_whitelist
    %r{image/}
  end
end
