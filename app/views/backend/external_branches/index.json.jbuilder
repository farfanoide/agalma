json.array!(@backend_external_branches) do |backend_external_branch|
  json.extract! backend_external_branch, :id, :name, :description, :address, :email, :zipcode, :zone
  json.url backend_external_branch_url(backend_external_branch, format: :json)
end
