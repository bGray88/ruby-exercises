class Kid
    def initialize
        @sugar_level = 0
        @calm = true
    end

    def grams_of_sugar_eaten
        return @sugar_level
    end

    def eat_candy
        @sugar_level += 5
        update_calm
    end

    def update_calm
        @sugar_level >= 60 ? @calm = false : @calm = true
    end

    def hyperactive?
        return !@calm
    end
end