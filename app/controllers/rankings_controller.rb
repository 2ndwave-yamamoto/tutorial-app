class RankingsController < ApplicationController
    def index
    # いいねランキング
    @likes_ranks = Blog.find(Like.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    # アクセスランキング
    @access_ranks = Blog.order(impressions_count: 'DESC')
    # コメントランキング
    @comments_ranks = Blog.find(Comment.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    # 投稿数ランキング
    @users_ranks = User.find(Blog.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    # ユーザコメント投稿ランキング
    @comments_user_ranks = User.find(Comment.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))    
    end
end
