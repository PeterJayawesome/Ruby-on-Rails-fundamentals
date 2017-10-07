class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, through: :friendships, source: :friend
end
