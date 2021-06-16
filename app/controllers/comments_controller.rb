class CommentsController < ApplicationController
  before_action :logged_in_user, only:[:create]

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = @current_user.id
        @comment.save
        render :index
      end
    
      private
        def comment_params
          params.require(:comment).permit(:body, :blog_id, :user_id)
        end
end
