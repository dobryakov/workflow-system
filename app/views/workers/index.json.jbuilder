json.array!(@workers) do |worker|
  json.extract! worker, :id
  json.url worker_url(worker, format: :json)
end
