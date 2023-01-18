class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def last_3_posts
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
