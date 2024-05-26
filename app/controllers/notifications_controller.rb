class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    # 通知の種類によるリダイレクトパスの生成
    case notification.notifiable_type
    when "Post"
      redirect_to post_path(notification.notifiable)
    when "PostComment"
      redirect_to post_path(notification.notifiable.post)
    else
      redirect_to user_path(notification.notifiable.user_id)
    end
  end

  def destroy
  end
end
