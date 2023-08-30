require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  let!(:user) { User.create(name: 'User', bio: 'Bio', photo: 'photo.jpg') }
  let!(:post) { user.posts.create(title: 'Post Title', text: 'Post text') }
  let!(:comment) { post.comments.create(author: user, text: 'Comment text') }

  it 'displays the post\'s title' do
    visit user_posts_path(user)
    expect(page).to have_content('Post text')
  end
  
  it 'displays who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content('by User')
  end
  
  it 'displays the number of comments the post has' do
    visit user_post_path(user, post)
    expect(page).to have_content('Comments: 1')
  end

end
