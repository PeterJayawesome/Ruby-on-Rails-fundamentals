class UsersController < ApplicationController
  def new

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to messages_path
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to users_new_path 
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:username)
  end
end
