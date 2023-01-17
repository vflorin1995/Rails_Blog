json.extract! post, :id, :Title, :Text, :CommentsCounter, :LikesCounter, :created_at, :updated_at
json.url post_url(post, format: :json)
