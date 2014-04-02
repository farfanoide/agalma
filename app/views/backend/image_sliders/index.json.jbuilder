json.array!(@image_sliders) do |image_slider|
  json.extract! image_slider, :id, :image
  json.url image_slider_url(image_slider, format: :json)
end
