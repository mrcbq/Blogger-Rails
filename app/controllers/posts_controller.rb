class PostsController < ApplicationController
  before_action :set_user

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

  def new
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def like
    @post = @user.posts.find(params[:id])
    @like = @post.likes.create(author: current_user)
    @like.save
    redirect_to user_post_path(@user, @post)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
