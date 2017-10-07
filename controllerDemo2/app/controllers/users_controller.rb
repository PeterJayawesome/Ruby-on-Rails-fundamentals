class UsersController < ApplicationController
  def new

  end

  def total
    @count = User.all.size
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(param_from_form)
    redirect_to "/users"
  end
  private
    def param_from_form
      params.require(:user).permit(:name)
    end
end
