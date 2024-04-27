class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
   
  def show
    @user = User.find_by(account_name: params[:account_name])
    @latest_post = @user.posts.last
    @latest_post_body = @user.posts.any? ? @user.posts.last.body : "まだつぶやきはありません"
  end

  def edit
    @user = User.find_by(account_name: params[:account_name])
  end

  def update
    user = User.find_by(account_name: params[:account_name])
    tag_list = params[:user][:tag_ids].split(',')
    if user.update(user_params)
      user.save_tags(tag_list)
      redirect_to user_path(current_user.account_name)
    end
  end

  def check
    
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :album_jacket_1, :album_jacket_2, :favorite_picture_1, :favorite_picture_2, :favorite_picture_3, :favorite_item_1, :favorite_item_2, :favorite_item_3, :favorite_item_4, :favorite_item_5, :favorite_item_6, :favorite_item_7, :favorite_item_8)
  end
  
  def ensure_guest_user
    if current_user.guest_user?
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集できません。"
    end
  end
end
