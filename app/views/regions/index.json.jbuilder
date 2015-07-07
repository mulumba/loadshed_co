json.array!(@regions) do |region|
  json.extract! region, :id, :region, :region_code
  json.url region_url(region, format: :json)
end
