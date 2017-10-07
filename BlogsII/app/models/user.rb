class User < ActiveRecord::Base
	has_many :posts
	has_many :messages
	has_many :owners
	has_many :post_on_blogs, through: :post, source: :blog
	has_many :blogs, through: :owners
	has_many :comments, as: :leaved_to
	has_many :send_comments, source: :comments
end
