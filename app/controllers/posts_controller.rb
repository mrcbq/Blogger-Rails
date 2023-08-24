class PostsController < ApplicationController
  def index
    @page_title = 'Post Index Page'
    @user = User.find(params[:user_id])
    @posts = @user.posts
    end
  
    def show
    @page_title = 'Post Show Page'
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    end
  end
  