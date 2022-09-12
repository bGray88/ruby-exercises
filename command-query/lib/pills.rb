class Pills
    def initialize
        @bottle = (1..60).to_a
    end

    def count
        @bottle.count
    end

    def pop
        @bottle.pop
    end
end