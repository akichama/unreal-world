class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
  end
  
  def destroy
    @user = User.destroy(params[:id])
    redirect_to admin_user_path
  end

private

  def customer_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
