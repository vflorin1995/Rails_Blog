require 'rails_helper'

RSpec.describe 'post/show.html.erb', type: :system do
  subject { User.new(name: 'test', photo: 'http://google.com', bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      post = Post.create(author: subject, title: 'Hello00', text: 'This is my first post')

      Comment.create(text: 'Hello0', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello1', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello2', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello3', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello4', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello5', author_id: subject.id, post_id: post.id)

      visit user_post_path(subject, post)

      expect(page).to have_content(post.title)
      expect(page).to have_content(subject.name)
      expect(page).to have_content('Comments: 6')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content('This is my first post')
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
        expect(page).to have_content(comment.author.name)
      end
    end
  end
end