class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
    post = Post.destroy(params[:id])
    redirect_to admin_user_path(post.user)
  end
end
