require 'rails_helper'
feature "user log out" do

	scenario "user can log out" do
		visit users_new_path
		fill_in "user[username]", with: "Peter"
	    click_button "Create User"
		click_on "Log out"
		expect(current_path).to eq users_new_path
	end
end