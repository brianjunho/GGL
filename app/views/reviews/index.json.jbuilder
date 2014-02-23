json.array!(@reviews) do |review|
  json.extract! review, :id, :rating, :statement
  json.url review_url(review, format: :json)
end
