require 'rails_helper'

RSpec.describe 'user/show.html.erb', type: :system do
  subject { User.new(Name: 'test', Photo: 'http://google.com', Bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      Post.create(user_id: subject.id, Title: 'Hello0', Text: 'This is my first post')
      post = Post.create(user_id: subject.id, Title: 'Hello1', Text: 'This is my second post')
      Post.create(user_id: subject.id, Title: 'Hello2', Text: 'This is my third post')
      Post.create(user_id: subject.id, Title: 'Hello3', Text: 'This is my fourth post')
      sleep(5)

      visit user_path(subject)
      expect(page).to have_xpath("//img[@src = 'http://google.com']")
      expect(page).to have_content('test')
      expect(page).to have_content('Programmer')
      expect(page).to have_content('View all posts')
      expect(page).to have_content('Number of posts: 4')

      subject.last_3_posts.each do |ppost|
        expect(page).to have_content(ppost.Title)
        expect(page).to have_content(ppost.Text)
      end

      click_link('Hello1')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))

      visit user_path(subject)
      click_link('View all posts')
      sleep(5)
      expect(page).to have_current_path(user_posts_path(subject))
    end
  end
end