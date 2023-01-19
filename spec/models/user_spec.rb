require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Testing user without name' do
    user = User.create
    expect(user).to_not be_valid
  end

  it 'Testing user PostCounter number negative' do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    user.PostsCounter = -10
    expect(user).to_not be_valid
  end

  it 'Testing user PostCounter decimal number' do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    user.PostsCounter = 10.2
    expect(user).to_not be_valid
  end

  it 'User last 3 posts' do
    user = User.create(Name: 'John', Photo: 'www.google.com', Bio: 'Male')
    Post.create(user_id: 1, Title: 'Title1', Text: 'Hello1')
    Post.create(user_id: 1, Title: 'Title1', Text: 'Hello2')
    Post.create(user_id: 1, Title: 'Title1', Text: 'Hello3')
    Post.create(user_id: 1, Title: 'Title1', Text: 'Hello4')

    expect(user.last_3_posts.length).to eq(3)
  end
end
