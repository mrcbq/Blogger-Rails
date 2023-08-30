require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  let!(:user) { User.create(name: 'User', bio: 'Bio', photo: 'photo.jpg') }

  before do
    3.times { |i| user.posts.create(title: "Post #{i + 1}", text: "text #{i + 1}") }
  end

  it 'displays the user\'s profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src*='photo.jpg']")
  end

  it 'displays the user\'s username' do
    visit user_path(user)
    expect(page).to have_content('User')
  end

  it 'displays the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'displays the user\'s bio' do
    visit user_path(user)
    expect(page).to have_content('Bio')
  end

  it 'displays the user\'s first 3 posts' do
    visit user_path(user)
    expect(page).to have_content('text 1')
    expect(page).to have_content('text 2')
    expect(page).to have_content('text 3')
  end

  it 'displays a button to view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('See all posts', href: user_posts_path(user))
  end

  it 'redirects to a post\'s show page upon clicking on a user\'s post' do
    visit user_path(user)
    first('p', text: 'Post #').click
    expect(page).to have_current_path(user_path(user))
    save_and_open_page
  end

  it 'redirects to the user\'s post index page upon clicking to see all posts' do
    visit user_path(user)
    first('button', text:'See all posts').click
    expect(page).to have_current_path(user_path(user))
  end
end
