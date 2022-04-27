class Message < ApplicationRecord
    include MessageConcern

    belongs_to :user

    validates :body, presence: true
    
    after_save :schedule_webhook_on_create, if: :new_message?
end
