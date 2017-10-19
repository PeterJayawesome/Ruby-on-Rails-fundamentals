FactoryGirl.define do
  factory :message do
    content "Test content"
    user
  end
end
