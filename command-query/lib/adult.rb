class Adult
    def initialize
        @drinks = 0
        @DRUNK = 3
    end

    def consume_an_alcoholic_beverage
        @drinks += 1
    end

    def sober?
        return @drinks < @DRUNK
    end
end