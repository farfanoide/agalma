# encoding: utf-8

class ImageSliderUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fill: [1170, 310]
  version :thumb do
    process resize_to_fill: [200,200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
