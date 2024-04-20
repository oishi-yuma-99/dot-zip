class Public::UsersController < ApplicationController
  def show
    @user = User.find_by(account_name: params[:account_name])
  end
  
  def edit
    @user = User.find_by(account_name: params[:account_name])
  end
  
  def update
    user = User.find_by(account_name: params[:account_name])
    user.update(user_params)
    redirect_to user_path(current_user.account_name) 
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :album_jacket_1, :album_jacket_2, :favorite_picture_1, :favorite_picture_2, :favorite_picture_3, :favorite_item_1, :favorite_item_2, :favorite_item_3, :favorite_item_4, :favorite_item_5, :favorite_item_6, :favorite_item_7, :favorite_item_8)
  end
end
