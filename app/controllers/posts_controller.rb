class PostsController < ApplicationController
  def index
    user_id = params[:user_id].to_i
    @posts = Post.where(user_id: user_id)
    @user = User.find(user_id)
  end

  def show
    user_id = params[:user_id].to_i
    post_id = params[:id].to_i
    @post = Post.find(post_id)
    @user = User.find(user_id)
  end
end
