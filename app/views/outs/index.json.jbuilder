json.array!(@outs) do |out|
  json.extract! out, :id
  json.url out_url(out, format: :json)
end
