require './spec/rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester') }
  let(:post) { Post.new(author:, title: 'Post test', text: 'Description test') }
  subject { Like.new(author:, post:) }

  before { subject.save }

  it 'belongs to a post' do
    expect(subject.post).to eq(post)
  end

  it 'belongs to an author' do
    expect(subject.author).to eq(author)
  end

  context 'update_likes_count' do
    it 'updates the likes_count of the post after creating a new Like' do
      expect(post.likes_count).to eq(1)
      Like.create(author:, post:)
      expect(post.likes_count).to eq(2)
    end
  end
end
