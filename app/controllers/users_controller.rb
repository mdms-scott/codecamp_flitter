class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:destroy]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else
      render :show
    end
  end
  
end
