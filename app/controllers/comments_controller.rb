class CommentsController < ApplicationController
  before_action :set_user_post

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
