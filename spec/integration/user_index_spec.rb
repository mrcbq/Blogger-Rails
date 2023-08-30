require './spec/rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  let!(:user1) { User.create(name: 'User1', bio: 'Bio1', photo: 'photo1.jpg') }
  let!(:user2) { User.create(name: 'User2', bio: 'Bio2', photo: 'photo2.jpg') }

  it 'displays usernames of all other users' do
    visit '/users'
    expect(page).to have_content('User1')
    expect(page).to have_content('User2')
  end

  it 'displays profile pictures for each user' do
    visit '/users'
    expect(page).to have_css("img[src*='photo1.jpg']")
    expect(page).to have_css("img[src*='photo2.jpg']")
  end

  it 'displays the number of posts each user has written' do
    user1.posts.create(title: 'Post1', text: 'text1')
    user1.posts.create(title: 'Post2', text: 'text2')

    visit '/users'
    expect(page).to have_content('Number of posts:', count: 2)
  end

  it 'redirects to a user\'s show page upon clicking on a user' do
    visit '/users'
    click_on 'User1'
    expect(page).to have_current_path(user_path(user1))
  end
end
