class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
		@count = Dojo.all.size
	end
end