class ScheduledWebhook < ApplicationRecord
    belongs_to :user
    belongs_to :webhook

    enum status: {
        pending: 0,
        success: 1,
        failure: 2
    }
end
