json.array!(@edits) do |edit|
  json.extract! edit, :id, :proofread
  json.url edit_url(edit, format: :json)
end
