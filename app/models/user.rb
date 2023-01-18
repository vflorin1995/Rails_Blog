class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments
    
    def last3posts
        Post.where(user_id: self.id).order(created_at: :desc).limit(3)
    end
end
