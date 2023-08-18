require './spec/rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Tester') }
  subject { Post.new(author:, title: 'Post test', text: 'Description test') }

  before { subject.save }

  context 'Validation' do
    it 'should have the title present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'the title should have a maximum 250 characters' do
      subject.title = 'z' * 251
      expect(subject).to_not be_valid
    end

    it 'should have likes and comments counts set to 0 or greater than 0' do
      subject.likes_count = -1
      subject.comments_count = -1
      expect(subject).to_not be_valid
    end
  end

  context 'update_posts_count' do
    it 'updates the posts_count of the post author after creating a post' do
      expect(author.posts_count).to eq(1)
      Post.create(author:, title: 'Post test 2', text: 'Description test 2')
      expect(author.posts_count).to eq(2)
    end
  end

  describe 'recent_comments' do
    it 'returns the 5 most recent comments' do
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now)
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now - 1.days)
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now - 2.days)
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now - 3.days)
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now - 4.days)
      Comment.create(text: 'Comment', post: subject, author:, created_at: Time.now - 5.days)

      expect(subject.recent_comments).to eq(subject.comments.first(5))
    end
  end

  describe 'set_default_like_n_comments_counts' do
    it 'should set the likes and comments counts to 0 when you create a new instance of Post' do
      expect(subject.likes_count).to eq(0)
      expect(subject.comments_count).to eq(0)
    end
  end
end
