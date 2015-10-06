json.array!(@wowolinks) do |wowolink|
  json.extract! wowolink, :id
  json.url wowolink_url(wowolink, format: :json)
end
