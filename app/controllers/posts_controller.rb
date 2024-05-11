class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #byebug
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @user = current_user
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
   private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
  
end
