require 'rails_helper'

RSpec.describe 'PostsRequests', type: :request do
  describe 'GET /index' do
    it 'gets posts' do
      get '/posts/index'
      expect(response).to have_http_status(200)
      expect(response.body).to include('List of posts')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'return https status success' do
      get '/posts/show'
      expect(response).to have_http_status(200)
      expect(response.body).to include('This is a single post')
      expect(response).to render_template(:show)
    end
  end
end
