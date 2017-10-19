require 'rails_helper'
feature "guest user creates an account" do
	before(:each) do
		visit users_new_path
	end

  scenario "successfully creates a new user account" do
    fill_in "user[username]", with: "shane"
    click_button "Create User"
    expect(current_path).to eq messages_path
    expect(page).to have_content "Welcome, shane"
  end

  scenario "doesn't fill out username field" do
    click_button "Create User"
    expect(current_path).to eq users_new_path
    expect(page).to have_content "Username can't be blank"
  end

  scenario "doesn't fill out username field longer than 5" do
  	fill_in "user[username]",with: "test"
  	click_button "Create User"
  	expect(current_path).to eq users_new_path
  	expect(page).to have_content "Username is too short (minimum is 5 characters)"
  end


end