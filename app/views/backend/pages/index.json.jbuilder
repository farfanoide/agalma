json.array!(@backend_pages) do |backend_page|
  json.extract! backend_page, :id, :title, :slug, :body, :active
  json.url backend_page_url(backend_page, format: :json)
end
