module ScheduledWebhookConcern
    extend ActiveSupport::Concern

    def enque_delivery
        if next_retry_at.present?
        else
            WebhookDeliveryJob.perform_later(id)
        end
    end

    def deliver
        return unless pending?
        begin
            response = HTTParty.post(
                self.webhook.address, 
                options: { body: self.object.attributes }.to_json
            )
            Rails.logger.info(response)
            if response.success?
                succeed
            else
                failed
            end
        rescue => exception
            failed
        end
    end

    def succeed
        update(status: "success", next_retry_at: nil)
    end

    def failed
        # if (DateTime.now - 1.day) > created_at
        #     update(status: "failure", next_retry_at: nil)
        # else
        #     update(next_retry_at: calculate_next_retry)
        # end
        update(status: "failure", next_retry_at: nil)
    end

    def calculate_next_retry
        DateTime.now + 5.minutes
    end

    def object
        object_class.constantize.find(object_id)
    end

end