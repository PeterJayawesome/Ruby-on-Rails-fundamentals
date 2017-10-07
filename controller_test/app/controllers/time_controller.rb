class TimeController < ApplicationController
  def index
  	if not session.key?("times")
  		session[:times]=0
  	end
  	session[:times]+=1
  end

  def restart
  	session.clear
  	redirect_to "/time"
  end
end
