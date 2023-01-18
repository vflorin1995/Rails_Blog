class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def updateLikeCounterForAPost
        post = Post.find_by(id: self.post_id)
        count = Like.where(post_id: post.id).count
        post.update(LikesCounter: count)
    end
end
