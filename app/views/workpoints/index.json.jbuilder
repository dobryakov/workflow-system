json.array!(@workpoints) do |workpoint|
  json.extract! workpoint, :id
  json.url workpoint_url(workpoint, format: :json)
end
