require 'rails_helper'

RSpec.describe Message, type: :model do
	it "must be required" do
		expect(build(:message,content:"")).to be_invalid
	end

	it "must be longer than 10 characters" do
		expect(build(:message,content:"Testtest1")).to be_invalid
	end

	it "must have a user" do
		expect(build(:message,user:nil)).to be_invalid
	end
end
