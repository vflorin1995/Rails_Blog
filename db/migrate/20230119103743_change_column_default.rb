class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :PostsCounter, from: nil, to: 0
    change_column_default :posts, :CommentsCounter, from: nil, to: 0
    change_column_default :posts, :LikesCounter, from: nil, to: 0
  end
end
