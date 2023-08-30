require './spec/rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:user) { User.create!( name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester') }

  describe 'GET #show' do
    it 'renders a successful response' do
      get "/users/#{user.id}"
      expect(response.status).to eq(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template('show')
    end

    it 'assigns the correct user' do
      get "/users/#{user.id}"
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #index' do
    it 'renders a successful response' do
      get '/users'
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'assigns the correct user' do
      get "/users/"
      expect(assigns(:users)).to eq([user])
    end
  end
end
