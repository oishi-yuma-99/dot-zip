class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
