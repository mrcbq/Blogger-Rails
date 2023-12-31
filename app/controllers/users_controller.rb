class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @page_title = 'User Index Page'
    @users = User.all
  end

  def show
    @page_title = 'User Show Page'
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
