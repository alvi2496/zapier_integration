class Webhook < ApplicationRecord
    belongs_to :user

    enum topic: {
        message_created: 0
    }
end
