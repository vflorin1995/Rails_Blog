class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @posts = Post.where(user_id:)
    @user = User.find(user_id)
  end

  def show
    user_id = params[:user_id].to_i
    post_id = params[:id].to_i
    @post = Post.find(post_id)
    @user = User.find(user_id)
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
