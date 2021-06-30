class BoxsController < ApplicationController
    def index
        @boxs = Blog.only_deleted
    end
    # 復元
    def update
        @boxs =  Blog.only_deleted.find_by(params[:id]).restore
        redirect_to  blogs_path 
    end

    # 物理削除
    def destroy
        if current_user != nil && @blog.user_id == current_user.id
            @blogs.destroy
            respond_to do |format|
                format.html { redirect_to blogs_url, notice: "ブログを削除しました" }
                format.json { head :no_content }
            end
        else
            redirect_to  "/blogs", notice: "投稿したユーザでないので削除できません"
        end
    end
end
