require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /index' do
    it '/users test' do
      get '/users'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include 'This is a list of all users'
    end

    it '/users/id test' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include 'This is a single user'
    end
  end
end
