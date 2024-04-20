class Public::AccountsController < ApplicationController
  def edit
    @user = User.find_by(account_name: params[:account_name])
  end
  
  def update
    @user = User.find_by(account_name: params[:account_name])
    if params[:account][:account_name].blank?
      @user.errors.add(:account_name, :blank)
      render "edit", status: :unprocessable_entity
    elsif @user.update(user_params)
      flash[:notice] = "アカウント情報が更新されました"
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find_by(account_name: params[:account_name])
  end

  def user_params
    params.require(:account).permit(:account_name)
  end
end
