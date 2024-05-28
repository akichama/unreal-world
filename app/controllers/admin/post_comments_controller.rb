class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    comment = Post.find(params[:post_id]).post_comments.find(params[:id]).destroy
    redirect_to admin_user_path(comment.post.user)
  end
end
