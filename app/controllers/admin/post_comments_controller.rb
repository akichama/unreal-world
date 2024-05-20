class Admin::PostCommentsController < ApplicationController
  def destroy
    comment = Post.find(params[:post_id]).post_comments.find(params[:id]).destroy
    redirect_to admin_user_path(comment.post.user)
  end
end
