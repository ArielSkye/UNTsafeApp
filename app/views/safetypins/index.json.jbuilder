json.array!(@safetypins) do |safetypin|
  json.extract! safetypin, :id, :latitude, :longitude, :address, :description
  json.url safetypin_url(safetypin, format: :json)
end
