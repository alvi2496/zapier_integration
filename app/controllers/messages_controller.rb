class MessagesController < ApplicationController

    def index
        @messages = current_user.messages
    end

    def new
        @message = Message.new
    end

    def create
        message = current_user.messages.new(message_params)
        if message.save
            flash[:message] = "Message created successfully"
        else
            flash[:error] = "Error creating message"
        end
        redirect_to messages_path
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end
end
