class UsersController < ApplicationController
	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
	  @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
	  if @user.save
	    flash[:notice] = ["Welcome, #{@user.first_name}"]
	    redirect_to "/users/#{@user.id}"
	  else
	    #errors we need to code later
	    flash[:notice] = @user.errors.full_messages
	    redirect_to new_user_path
	  end
	end
end
