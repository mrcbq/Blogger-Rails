class UsersController < ApplicationController
  def index
    @page_title = 'User Index Page'
    @users = User.all
  end

  def show
    @page_title = 'User Show Page'
    @user = User.find(params[:id])
  end
end
