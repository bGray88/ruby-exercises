class Clock
    def initialize()
        @current = 6
    end

    def time()
        return @current
    end

    def wait()
        @current += 1
        rollover
    end

    def rollover
        @current > 12 ? @current = 1 : nil
        @current < 1 ? @current = 12 : nil
    end
end