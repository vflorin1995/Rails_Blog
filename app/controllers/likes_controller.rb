class LikesController < ApplicationController
  def create
    user = current_user
    @like = Like.new(
      post_id: params[:post_id],
      user_id: user.id
    )

    return unless @like.save

    redirect_to user_posts_path
  end
end
