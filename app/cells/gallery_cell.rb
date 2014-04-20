class GalleryCell < Cell::Rails

  def gallery_slider
     @gallery_slider ||= Galery.first
  end

end
