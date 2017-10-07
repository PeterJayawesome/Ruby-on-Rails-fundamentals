class Dojo < ActiveRecord::Base
	has_many :ninjas
	validates :name,:city, presence: true
	validates :state, presence: true, length: {is: 2}
end
