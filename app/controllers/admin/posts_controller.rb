class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
    post = Post.destroy(params[:id])
    redirect_to admin_user_path(post.user)
  end
end
