class WebhookDeliveryJob < ApplicationJob
  queue_as :default

  def perform(scheduled_webhook_id)
    scheduled_webhook = ScheduledWebhook.pending.find(scheduled_webhook_id)
    scheduled_webhook.deliver
  end
end
