json.array!(@backend_menus) do |backend_menu|
  json.extract! backend_menu, :id, :name
  json.url backend_menu_url(backend_menu, format: :json)
end
