class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    def last5comments
        Comment.where(post_id: self.id).order(created_at: :desc).limit(5)
    end

    def updatePostCountForUser
        user = User.find_by(id: self.user_id)
        counter = Post.where(user_id: user.id).count
        user.update(PostsCounter: counter)
    end
end
