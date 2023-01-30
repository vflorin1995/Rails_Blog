require 'rails_helper'

RSpec.describe 'user/index.html.erb', type: :system do
  subject { User.new(name: 'test', photo: 'http://google.com', bio: 'Programmer') }
  before { subject.save }

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('test')
      expect(page).to have_xpath("//img[@src = 'http://google.com' and @alt='test photo']")
      expect(page).to have_content('Number of posts: 0')

      click_link('test')
      sleep(5)
      expect(page).to have_current_path(user_path(subject))
    end
  end
end