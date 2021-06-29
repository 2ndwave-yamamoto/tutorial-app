class ApplicationController < ActionController::Base
    # セッションヘルパーの呼び出し
    include SessionsHelper

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
  
    # URL直接打ち込み
    # ユーザがログインしていない場合一覧に戻る
    def no_user
      if current_user == nil
        redirect_to root_path
      end
    end
end
