module MessageConcern

    def new_message?
        created_at == updated_at
    end
    
    def schedule_webhook_on_create
        return unless user.registered_with?("message_created")
        webhook = user.webhooks.find_by(topic: "message_created")
        return unless webhook.present?
        scheduled_webhooks = user.scheduled_webhooks.create(
            webhook_id: webhook.id,
            object: self.class.to_s,
            object_id: id
        )
    end
end