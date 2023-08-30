require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  let!(:user) { User.create(name: 'User', bio: 'Bio', photo: 'photo.jpg') }

  before do
    5.times { |i| user.posts.create(title: "Post #{i + 1}", text: "Text #{i + 1}") }
  end

  # it 'displays the user\'s profile picture' do
  #   visit user_posts_path(user)
  #   expect(page).to have_css("img[src*='photo.jpg']")
  # end

  # it 'displays the user\'s username' do
  #   visit user_posts_path(user)
  #   expect(page).to have_content('User')
  # end

  # it 'displays the number of posts the user has written' do
  #   visit user_posts_path(user)
  #   expect(page).to have_content('Number of posts: 5')
  # end

  it 'displays a post\'s title' do
    visit user_posts_path(user)
    save_and_open_page
    expect(page).to have_content("Post 1")
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 4')
    expect(page).to have_content('Post 5')
  end

  it 'displays some of a post\'s body' do
    visit user_posts_path(user)
    expect(page).to have_content('Text 1', count: 1)
    expect(page).to have_content('Text 2', count: 1)
    expect(page).to have_content('Text 3', count: 1)
    expect(page).to have_content('Text 4', count: 1)
    expect(page).to have_content('Text 5', count: 1)    
  end

  it 'displays the first comments on a post' do
    post = user.posts.first
    post.comments.create(author: user, text: 'Comment 1')
    post.comments.create(author: user, text: 'Comment 2')

    visit user_posts_path(user)
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
    # ... Repeat for other posts
  end

  it 'displays how many comments a post has' do
    post = user.posts.first
    post.comments.create(user: user, body: 'Comment 1')
    post.comments.create(user: user, body: 'Comment 2')

    visit user_posts_path(user)
    expect(page).to have_content('Comments: 2')
    # ... Repeat for other posts
  end

  it 'displays how many likes a post has' do
    post = user.posts.first
    post.likes.create(user: user)

    visit user_posts_path(user)
    expect(page).to have_content('Likes: 1')
    # ... Repeat for other posts
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    # Assuming 5 posts are created, and you want to display 3 per page
    visit user_posts_path(user)
    expect(page).to have_css('.pagination')
  end

  it 'redirects to a post\'s show page upon clicking on a post' do
    visit user_posts_path(user)
    click_on 'Post 1'
    expect(page).to have_current_path(user_post_path(user, user.posts.first))
  end
end
