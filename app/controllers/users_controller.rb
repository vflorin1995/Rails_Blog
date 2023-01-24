class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user_id = params[:id].to_i
    @user = User.find(user_id)
    @posts = Post.where(user_id: user_id)
  end
end
