class Money
    def initialize()
        @bank = 0
    end

    def amount()
        return @bank
    end

    def earn(deposit)
        @bank += deposit
    end
end