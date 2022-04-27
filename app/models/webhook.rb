class Webhook < ApplicationRecord
    belongs_to :user
    has_many :scheduled_webhooks

    validates :topic, :address, presence: true
    validates_uniqueness_of :topic, scope: :user_id

    enum topic: {
        message_created: 0
    }
end
