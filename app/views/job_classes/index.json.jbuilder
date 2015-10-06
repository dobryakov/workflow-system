json.array!(@job_classes) do |job_class|
  json.extract! job_class, :id
  json.url job_class_url(job_class, format: :json)
end
