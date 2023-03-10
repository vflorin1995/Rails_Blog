class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :likes
  has_many :comments

  validates :Name, presence: true
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :PostsCounter, numericality: { only_integer: true }

  def last_3_posts
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
