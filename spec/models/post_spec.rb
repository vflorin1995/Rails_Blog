require 'rails_helper'

RSpec.describe Post, type: :model do
  it "Post without name" do
    post = Post.create(user_id: 1, Text: "Hello1")
    expect(post).to_not be_valid
  end

  it "Post with comment counter negative" do
    post = Post.create(user_id: 1, Text: "Hello1")
    post.CommentsCounter = -1
    expect(post).to_not be_valid
  end

  it "Post with comment counter decimal" do
    post = Post.create(user_id: 1, Text: "Hello1")
    post.CommentsCounter = 2.2
    expect(post).to_not be_valid
  end

  it "Post with likes counter decimal" do
    post = Post.create(user_id: 1, Text: "Hello1")
    post.LikesCounter = 2.2
    expect(post).to_not be_valid
  end

  it "Post with likes counter decimal" do
    post = Post.create(user_id: 1, Text: "Hello1")
    post.LikesCounter = 2.2
    expect(post).to_not be_valid
  end

  it "Post with title length >250 characters" do
    post = Post.create(user_id: 1,Title: 'one' ,Text: "Hello1")
    post.Title = (0...255).map { 'a' }.join
    expect(post).to_not be_valid
  end

  it "Update post counter" do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    post = Post.create(user_id: user.id, Title: "hello", Text: "Hello1")
    user2 = User.first

    expect(user2.PostsCounter).to eq(1)
  end

  it "last 5 comm" do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    post = Post.create(user_id: 1, Title: "Title1", Text: "Hello1")
    comment1 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)
    comment2 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)
    comment3 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)
    comment4 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)
    comment5 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)
    comment6 = Comment.create(Text: "Mata", user_id: user.id, post_id: post.id)

    expect(post.last_5_comments.length).to eq(5)
  end
end
