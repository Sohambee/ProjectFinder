class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  has_one :last_message, -> { order(created_at: :desc) }, class_name: 'Message'
  scope :unread,  -> { where(last_message: false) }

  scope :with_user, ->(user) { where('sender_id = (?) OR recipient_id = (?)', user.id, user.id) }

  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where('(conversations.sender_id = ? AND   conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)', sender_id, recipient_id, recipient_id, sender_id)
  end
end
