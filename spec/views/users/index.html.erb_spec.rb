require 'rails_helper'

RSpec.describe 'user/index.html.erb', type: :system do
  subject { User.new(Name: 'test', Photo: 'http://google.com', Bio: 'Programmer') }
  before(:each) do
    subject.save
    visit users_path
  end

  describe 'index page' do
    it 'shows the Name of the User' do
      expect(page).to have_content('test')
    end

    it 'shows the User Image' do
      expect(page).to have_xpath("//img[@src='http://google.com']")
    end

    it 'shows the right Number of Posts' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'Navigate to a specific post' do
      click_link('test')
      sleep(5)
      expect(page).to have_current_path(user_path(subject))
    end
  end
end
