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
       #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
    
end
