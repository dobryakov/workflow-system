json.array!(@filters) do |filter|
  json.extract! filter, :id
  json.url filter_url(filter, format: :json)
end
