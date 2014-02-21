json.array!(@images) do |image|
  json.extract! image, :id, :file_name, :name, :galery_id
  json.url image_url(image, format: :json)
end
