class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments, { comments: [:user] }]).find(params[:user_id].to_i)
  end

  def show
    @post = Post.includes(:comments, comments: [:user]).find(params[:id].to_i)
    @user = User.find(params[:user_id].to_i)
  end

  def new
    @post = Post.new
  end

  def create
    user = current_user
    @post = Post.new(
      Title: params[:title],
      Text: params[:text],
      user_id: user.id
    )
    return unless @post.save

    redirect_to user_posts_path
  end
end
