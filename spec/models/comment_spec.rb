require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Update comment counter for post' do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    post = Post.create(user_id: user.id, Title: 'ello', Text: 'Hello1')
    Comment.create(Text: 'Mata', user_id: user.id, post_id: post.id)
    postfirst = Post.first

    expect(postfirst.CommentsCounter).to eq(1)
  end
end
