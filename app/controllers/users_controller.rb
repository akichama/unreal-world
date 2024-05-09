class UsersController < ApplicationController
  def mypage
    @posts = current_user.posts
    @user = current_user
    render :show
  end

  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    user = current_customer
    user.update(user_params)
    redirect_to mypage_users_path
  end

  def destroy
  end

  def followings
  end

  def followers
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name)
  end
end
