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

  def follow
    @user = User.find(params[:id])
    if @user.followings.create(follower_id: current_user.id)
      redirect_to user_path(@user)
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @following = Following.find_by_user_id_and_follower_id(@user.id, current_user.id)
    if @following.destroy
      redirect_to user_path(@user)
    end
  end
  
end
