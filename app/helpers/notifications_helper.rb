module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.title}を投稿しました"
    when "PostComment"
      "投稿した#{notification.notifiable.post.title}に#{notification.notifiable.user.name}さんからコメントが来ました"
    else
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにいいねされました"
    end
  end

end
