require 'rails_helper'

describe "creating a book" do

	it 'signs in users' do 
		user = create(:user)
		visit login_path
		fill_in "session_email", :with => user.email
		fill_in "session_password", :with => user.password
		click_button 'Log In'
		# I should be on the /books page
	end

	it 'partilly filling in form' do
		visit '/books/new'

		fill_in 'book_post_attributes_price', with: '8'
		click_button 'commit'

		expect(page).to have_content '.alert'
	end
end