class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def updateCommentCounterForPost
        post = Post.find_by(id: self.post_id)
        count = Comment.where(post_id: post.id)
        post.update(CommentsCounter: count)
    end
end
