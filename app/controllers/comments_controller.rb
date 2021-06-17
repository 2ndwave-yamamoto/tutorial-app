class CommentsController < ApplicationController
  before_action :logged_in_user, only:[:create]

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = @current_user.id
        @comment.save
        render :index
      end
    
    def destroy
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to "/blogs", notice: "Comment was successfully destroyed." }
          format.json { head :no_content }
        end
    end

      private
        def comment_params
          params.require(:comment).permit(:body, :blog_id, :user_id)
        end
end
