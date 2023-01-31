require 'rails_helper'

RSpec.describe 'user/show.html.erb', type: :system do
  subject { User.new(Name: 'test', Photo: 'http://google.com', Bio: 'Programmer') }
  before(:each) do
    subject.save
    Post.create(user_id: subject.id, Title: 'Hello0', Text: 'This is my first post')
    Post.create(user_id: subject.id, Title: 'Hello1', Text: 'This is my second post')
    Post.create(user_id: subject.id, Title: 'Hello2', Text: 'This is my third post')
    Post.create(user_id: subject.id, Title: 'Hello3', Text: 'This is my fourth post')
    visit user_path(subject)
  end

  describe 'index page' do
    it 'shows the User Image' do
      sleep(5)
      expect(page).to have_xpath("//img[@src = 'http://google.com']")
    end

    it 'shows the User Name' do
      expect(page).to have_content('test')
    end

    it 'shows the User Bio' do
      expect(page).to have_content('Programmer')
    end

    it 'shows a link with the text "View all posts"' do
      expect(page).to have_content('View all posts')
    end

    it 'shows the right number of posts' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'shows the all posts title and text' do
      subject.last_3_posts.each do |ppost|
        expect(page).to have_content(ppost.Title)
        expect(page).to have_content(ppost.Text)
      end
    end

    it 'shows the specific post when the post title clicked' do
      post = Post.find_by(title: 'Hello1')
      click_link('Hello1')
      sleep(5)
      expect(page).to have_current_path(user_post_path(subject, post))
    end

    it 'shows all the posts when "View all post link clicked"' do
      click_link('View all posts')
      sleep(5)
      expect(page).to have_current_path(user_posts_path(subject))
    end
  end
end
