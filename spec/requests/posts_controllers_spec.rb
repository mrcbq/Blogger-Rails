require './spec/rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:user) { User.create!(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester') }
  let!(:post) { Post.create!(author: user, title: 'Post test', text: 'Description test') }

  describe 'GET #show' do
    it 'renders a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.status).to eq(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end

    it 'assigns the correct post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'GET #index' do
    it 'renders a successful response' do
      get "/users/#{user.id}/posts"
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template('index')
    end

    it 'assigns the correct posts' do
      get "/users/#{user.id}/posts"
      expect(assigns(:posts)).to eq([post])
    end
  end
end
