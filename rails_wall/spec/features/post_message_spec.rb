require 'rails_helper'
feature "user posts a message" do
	before(:each) do
		visit users_new_path
		fill_in "user[username]", with: "Peter"
	    click_button "Create User"
	end
	scenario "create a message successfully" do
		fill_in "message_content",with:"This is a test message."
		click_button "Post a Message"
		expect(current_path).to eq messages_path
	    expect(page).to have_content "This is a test message."
	end

	scenario "doesn't fill the message field" do
		click_button "Post a Message"
		expect(current_path).to eq messages_path
	    expect(page).to have_content "Content can't be blank"
	end

	scenario "doesn't fill the content longer than 10" do
		fill_in "message_content",with:"testtest1"
		click_button "Post a Message"
		expect(current_path).to eq messages_path
	    expect(page).to have_content "Content is too short (minimum is 10 characters)"
	end
end