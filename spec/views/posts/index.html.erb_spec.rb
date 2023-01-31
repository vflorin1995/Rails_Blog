require 'rails_helper'

RSpec.describe 'post/index.html.erb', type: :system do
  subject { User.new(Name: 'test', Photo: 'http://google.com', Bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      Post.create(user_id: subject.id, Title: 'Hello00', Text: 'This is my first post')
      Post.create(user_id: subject.id, Title: 'Hello10', Text: 'This is my second post')
      post = Post.create(user_id: subject.id, Title: 'Hello20', Text: 'This is my third post')
      Post.create(user_id: subject.id, Title: 'Hello30', Text: 'This is my fourth post')
      Comment.create(Text: 'Hello0', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello1', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello2', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello3', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello4', user_id: subject.id, post_id: post.id)
      Comment.create(Text: 'Hello5', user_id: subject.id, post_id: post.id)
      sleep(5)

      visit user_posts_path(subject)
      expect(page).to have_xpath("//img[@src = 'http://google.com']")
      expect(page).to have_content('test')
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Hello20')
      subject.posts.each do |ppost|
        expect(page).to have_content(ppost.Title)
        expect(page).to have_content(ppost.Text)
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
