class User < ActiveRecord::Base
	validates :first_name,:last_name, presence: true, length: {minimum: 2}, on: :create
	validates :age, presence: true,numericality: true, inclusion:{in: 10...150}, on: :create
	validates :email_address, presence: true, on: :create
end
