class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    # is_matching_login_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tags = []
    if post_params[:image].present?
      tags = Vision.get_image_data(post_params[:image]).compact
    end
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      tags.each do |tag|
        @post.tags.create!(name: tag)
      end
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @posts = Post.includes(:tags)
    @posts = @posts.where('tags.name': params[:tag_name]) if params[:tag_name].present?
    @posts = @posts.order(created_at: :desc)
    @posts = @posts.page(params[:page])
    @post_comment = PostComment.new
  end

  def show
    # is_matching_login_user
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    # is_matching_login_user
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to mypage_users_path(current_user)
  end

   private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def is_matching_login_user
      post = Post.find(params[:id])
    unless post.user == current_user
      redirect_to posts_path, notice: '許可されていない操作です'
    end
  end
end
