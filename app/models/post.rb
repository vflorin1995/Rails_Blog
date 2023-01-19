class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :Title, presence: true
  validates :Title, length: {maximum: 250}
  validates :CommentsCounter, numericality: {greater_than_or_equal_to: 0}
  validates :CommentsCounter, numericality: {only_integer: true}
  validates :PostsCounter, numericality: {greater_than_or_equal_to: 0}
  validates :PostsCounter, numericality: {only_integer: true}

  after_save :update_post_count_for_user

  def last_5_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_count_for_user
    user = User.find_by(id: user_id)
    counter = Post.where(user_id: user.id).count
    user.update(PostsCounter: counter)
  end
end
