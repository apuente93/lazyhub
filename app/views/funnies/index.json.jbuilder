json.array!(@funnies) do |funny|
  json.extract! funny, :article_id, :article_type
  json.url funny_url(funny, format: :json)
end