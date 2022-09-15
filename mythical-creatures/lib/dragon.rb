class Dragon
    attr_reader :name, :color, :rider
    def initialize(name, color, rider)
        @name = name
        @color = color
        @rider = rider
        @hungry = true
        @stomach = 0
        @health_pts = 100
    end

    def eat()
        @stomach += 1
    end

    def hungry?()
        return @stomach < 3
    end
end