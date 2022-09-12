class Beers
    def initialize
        @count = 99
    end

    def inventory
        return @count
    end

    def take_one_down_and_pass_it_around
        @count -= 1
    end

    def restock
        @count = 99
    end
end