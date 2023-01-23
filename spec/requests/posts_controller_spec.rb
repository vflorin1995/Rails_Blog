require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /index' do
    it '/users/id/posts test' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include 'This is a list of posts by one user'
    end
    it '/users/id/posts/id test' do
      get '/users/:id/posts/:id'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include 'This is a single post'
    end
  end
end
