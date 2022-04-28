class ScheduledWebhook < ApplicationRecord
    include ScheduledWebhookConcern

    belongs_to :user
    belongs_to :webhook

    after_save :enque_delivery, if: :pending?

    enum status: {
        pending: 0,
        success: 1,
        failure: 2
    }
end
