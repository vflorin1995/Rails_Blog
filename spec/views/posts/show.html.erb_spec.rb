require 'rails_helper'

RSpec.describe 'post/show.html.erb', type: :system do
  subject { User.new(Name: 'test', Photo: 'http://google.com', Bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      post = Post.create(user_id: subject.id, Title: 'Hello00', Text: 'This is my first post')

      Comment.create(Text: 'Hello0', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello1', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello2', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello3', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello4', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello5', user_id: subject.id, post_id: post.id)
      sleep(5)

      visit user_post_path(subject, post)

      expect(page).to have_content(post.Title)
      expect(page).to have_content(subject.Name)
      expect(page).to have_content('Comments: 6')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content('This is my first post')
      post.comments.each do |comment|
        expect(page).to have_content(comment.Text)
        expect(page).to have_content(comment.user.Name)
      end
    end
  end
end
