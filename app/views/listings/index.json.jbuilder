json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :prompt, :application, :option
  json.url listing_url(listing, format: :json)
end
