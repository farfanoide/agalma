# encoding: utf-8

class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  process resize_to_fit: [800, 800]
  version :thumb do
    process resize_to_fill: [200,200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end