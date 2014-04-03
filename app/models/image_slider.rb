class ImageSlider < ActiveRecord::Base
  mount_uploader :image, ImageSliderUploader

  validates_presence_of :image

end
