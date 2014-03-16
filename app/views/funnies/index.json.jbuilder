json.array!(@funnies) do |funny|
  json.extract! funny, :content, :article_id
  json.url funny_url(funny, format: :json)
end