class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @posts = current_user.posts
    @user = current_user
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    render :show
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
  end

  # def edit
  #   @user = current_user
  # end

  # def update
  #   @user = current_user
  #   @post = @user.posts
  #   user = current_user
  #   user.update(user_params)
  #   redirect_to post_path(@post)
  # end

  # def destroy
  #   user = Usre.find(params[:id])
  #   user.desttroy
  #   redirect_to new_user_registration_path
  # end

  def follows
    user = User.find(params[:user_id])
    @users = user.following_users
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_users
  end

  # private

  # def user_params
  #     params.require(:user).permit(:name, :image)
  # end
end
