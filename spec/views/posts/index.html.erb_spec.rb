require 'rails_helper'

RSpec.describe 'post/index.html.erb', type: :system do
  subject { User.new(name: 'test', photo: 'http://google.com', bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      Post.create(author: subject, title: 'Hello00', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello10', text: 'This is my second post')
      post = Post.create(author: subject, title: 'Hello20', text: 'This is my third post')
      Post.create(author: subject, title: 'Hello30', text: 'This is my fourth post')
      Comment.create(text: 'Hello0', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello1', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello2', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello3', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello4', author_id: subject.id, post_id: post.id)
      Comment.create(text: 'Hello5', author_id: subject.id, post_id: post.id)

      visit user_posts_path(subject)
      expect(page).to have_xpath("//img[@src = 'http://google.com' and @alt='test photo']")
      expect(page).to have_content('test')
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Hello20')
      subject.posts.each do |ppost|
        expect(page).to have_content(ppost.title)
        expect(page).to have_content(ppost.text)
      end
      expect(page).to have_content('Hello3')
      expect(page).to have_content('Comments: 6')
      expect(page).to have_content('Likes: 0')

      click_link('Hello20')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))
    end
  end
end