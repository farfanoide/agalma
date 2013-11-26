json.array!(@branches) do |branch|
  json.extract! branch, :name, :description
  json.url branch_url(branch, format: :json)
end
