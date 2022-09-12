class Water
    def initialize()
        @temp = 295
    end

    def temperature()
        return @temp
    end

    def heat()
        @temp += 1
    end
end