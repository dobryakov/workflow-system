json.array!(@messagefacts) do |messagefact|
  json.extract! messagefact, :id
  json.url messagefact_url(messagefact, format: :json)
end
