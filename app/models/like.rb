class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_counter_for_post
    post = Post.find_by(id: post_id)
    count = Like.where(post_id: post.id).count
    post.update(LikesCounter: count)
  end
end
