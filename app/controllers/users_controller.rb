class UsersController < ApplicationController
  #ユーザ登録ページ
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end