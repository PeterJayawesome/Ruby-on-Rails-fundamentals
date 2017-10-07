class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
		@count = Dojo.all.size
	end

	def show
		@dojo = Dojo.find(params[:id])
	end

	def edit
		@dojo = Dojo.find(params[:id])
	end

	def destroy
		dojo = Dojo.find(params[:id])
		dojo.destroy
		redirect_to "/dojos"
	end

	def new

	end

	def create
		dojo = Dojo.create(form_params)
		redirect_to "/dojos"
	end

	def update
		dojo = Dojo.find_by(params[:id])
		dojo.update(form_params)
		redirect_to "/dojos/#{dojo.id}"
	end

	private
	def form_params
		params.require(:dojo).permit(:branch,:street,:city,:state)
		
	end
end