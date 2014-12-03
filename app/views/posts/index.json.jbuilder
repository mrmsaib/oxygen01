json.array!(@posts) do |post|
  json.extract! post, :id, :image, :headline, :description, :source, :source_url
  json.url post_url(post, format: :json)
end
