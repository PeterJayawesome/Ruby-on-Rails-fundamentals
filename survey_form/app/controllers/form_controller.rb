class FormController < ApplicationController
  def index

  end

  def result
  	puts session[:result]
  end

  def submit
  	session[:result] = form_params
  	redirect_to "/result"
  end

  private
  	def form_params
  		params.permit(:name,:location,:language,:comment)
  	end
end
