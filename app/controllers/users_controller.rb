class UsersController < ApplicationController
  #ログインページ
  def new
  end

  #ユーザ登録ページ
  def index
  end

  #セッションの作成
  def create
    #ユーザIDの一致
    user = User.find_by(name: params[:session][:name])
    #ユーザIDとパスワードの一致
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      #不一致の場合、ログイン画面に戻る
      render 'new'
    end
  end

  #セッションの削除(ログアウト)
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  #ユーザ作成
  def registration
    byebug
    @user = User.new(user_params)
    if @user.save!
      redirect_to login_path  
    else
      render'index'
    end
  end


  private
  def user_params
    # nameとpasswordを受け取る
    params.fetch(:user, {}).permit(:name, :password)
  end
end