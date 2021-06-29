class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :no_user, only: %i[ new edit update destroy ]
  # GET /blogs or /blogs.json
  def index
    # 記事一覧
    params.keys.each { |x| params.delete x } if params[:clear].present?
    params[:search_created_at] = created_at_params
    @blogs = Blog.search(params).order(created_at: :desc)
    @blogs = @blogs.page(params[:page]).per(7)
  end
  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    @like = Like.new
    impressionist(@blog, nil, :unique => [:session_hash])
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  def edit

    #投稿者とログインユーザが一致しているか
    if current_user != nil && @blog.user_id == current_user.id
    else
      redirect_to "/blogs", notice: "投稿したユーザでないので編集できません"
    end
  end

  # blog /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    if current_user != nil && @blog.user_id == current_user.id
       @blog.destroy
       respond_to do |format|
         format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
         format.json { head :no_content }
      end
    else
      redirect_to  "/blogs", notice: "投稿したユーザでないので削除できません"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
    # titleとbodyを受け取る
    params.fetch(:blog, {}).permit(:title, :body)
    end

    def created_at_params
      return if params["search_created_at(1i)"].blank? || params["search_created_at(2i)"].blank? || params["search_created_at(3i)"].blank?
      Date.new(
        params["search_created_at(1i)"].to_i,
        params["search_created_at(2i)"].to_i,
        params["search_created_at(3i)"].to_i
      )
    end
end