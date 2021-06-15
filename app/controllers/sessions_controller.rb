class SessionsController < ApplicationController
  #ログインページ
  def new
  end

  #セッションの作成
  def create
    #ユーザIDの一致
    user = User.find_by(name: params[:session][:name])

    #ユーザIDとパスワードの一致
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to "/blogs"
    else
      #不一致の場合、ログイン画面に戻る
      render 'new'
    end

  end

  #セッションの削除(ログアウト)
  def destroy
    log_out if logged_in?
    redirect_to "/login"
  end

end
