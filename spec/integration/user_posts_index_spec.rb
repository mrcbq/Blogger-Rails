require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  let!(:user) { User.create(name: 'User', bio: 'Bio', photo: 'photo.jpg') }

  before do
    5.times { |i| user.posts.create(title: "Post #{i + 1}", text: "text #{i + 1}") }
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

end
