class CommentsController < ApplicationController
  def create
    user = current_user
    @comment = Comment.new(
      Text: params[:Text],
      post_id: params[:post_id],
      user_id: user.id
    )
    return unless @comment.save

    redirect_to request.original_url
  end
end
