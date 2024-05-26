class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true

   has_one :notification, as: :notifiable, dependent: :destroy

  after_create do
    create_notification(user_id: post.user_id)
  end
end
