module UserConcern
    extend ActiveSupport::Concern

    def assign_api_key
       random_key = Utils::RandomKeyGenerator.new(email).generate

       return assign_api_key if User.find_by(api_key: random_key).present?

       self.api_key = random_key
    end

    def registered_with?(topic)
        webhooks.pluck(:topic).include? topic
    end
end