class WebhooksController < ApplicationController
    def index
        @webhooks = current_user.webhooks
    end

    def new
        @webhook = Webhook.new
    end

    def create
        webhook = current_user.webhooks.new(webhook_params)
        if webhook.save
            flash[:notice] = "Webhook registered successfully"
        else
            flash[:alert] = "Error registering webhook"
        end
        redirect_to webhooks_path
    end

    private

    def webhook_params
        params.require(:webhook).permit(:topic, :address)
    end
end
