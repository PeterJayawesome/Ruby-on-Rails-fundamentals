require 'rails_helper'

RSpec.describe User, type: :model do
  it "must be required" do
  	expect(build(:user,username:"")).to be_invalid
  end

  it "must be unique" do
  	create(:user)
  	expect(build(:user)).to be_invalid
  end

  it "must be longer than 5 chatacters" do
  	expect(build(:user,username:"Test")).to be_invalid
  end
end
