class TrickOrTreater
    attr_reader :dressed_up_as, :bag

    def initialize(costume)
        @dressed_up_as = costume.style
        @bag = Bag.new
    end

    def has_candy?()
        return !@bag.empty?
    end

    def candy_count()
        return @bag.count
    end

    def eat()
        @bag.eat
    end
end