module UserConcern
    extend ActiveSupport::Concern

    def assign_api_key
       api_key = "abc123" 
    end
end