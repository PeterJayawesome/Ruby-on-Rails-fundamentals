rails g model User name:string
rails g model Friendship user:references friend:references
rake db:migrate



# User.first should retrieve the first user information
User.first
# User.first.friends should display all the friend 
# information of the first user (this should include 
# the first name and last name of all the friends 
# of User.first).
User.first.friends
# Find out how you can retrieve all users who are 
# NOT a friend with the first User.
User.where("users.id NOT IN (?)",User.first.friend_ids)



class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, through: :friendships, source: :friend
end



class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
