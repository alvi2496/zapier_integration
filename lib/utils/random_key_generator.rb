class Utils::RandomKeyGenerator

    def initialize(public_key)
        @public_key = public_key
    end

    def generate
        return Digest::SHA2.hexdigest("#{ENV['PRIVATE_KEY']}_#{@public_key}")
    end
end