json.array!(@comments) do |comment|
  json.extract! comment, :body, :author
  json.url movie_comments_url(comment, format: :json)
end
