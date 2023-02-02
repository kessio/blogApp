require 'rails_helper'

RSpec.describe 'UserRequests', type: :request do
  describe 'GET /index' do
    it 'gets users' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response.body).to include('List authors')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'gets a user' do
      get '/users/2'
      expect(response).to have_http_status(200)
      expect(response.body).to include('Show a single user')
      expect(response).to render_template(:show)
    end
  end
end
