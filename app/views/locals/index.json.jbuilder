json.array!(@locals) do |local|
  json.extract! local, :id, :owner_id, :name, :description
  json.url local_url(local, format: :json)
end
