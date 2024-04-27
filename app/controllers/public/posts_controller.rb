class Public::PostsController < ApplicationController
  
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿に成功しました。"
    else
      @posts = Post.all
      @user = current_user
      flash.now[:alert]
      render :index
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:body)
  end
end
