# frozen_string_literal: true

json.extract! like, :id, :created_at, :updated_at
json.url like_url(like, format: :json)
