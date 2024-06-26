class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find_by(account_name: params[:user_account_name])
    current_user.follow(user)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    user = User.find_by(account_name: params[:user_account_name])
    current_user.unfollow(user)
    redirect_back(fallback_location: root_path)
  end
  
  def followings
    @user = User.find_by(account_name: params[:user_account_name])
    @users = @user.followings.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def followers
    @user = User.find_by(account_name: params[:user_account_name])
    @users = @user.followers.order(created_at: :desc).page(params[:page]).per(10)
  end
end
