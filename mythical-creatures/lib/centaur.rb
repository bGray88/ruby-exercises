class Centaur
    attr_reader :name, :breed, :shoot, :run
    def initialize(name, breed)
        @name = name
        @breed = breed
        @standing = true
        @cranky = false
        @activities = 0
        @feeling_ill = false
    end

    def shoot
        if !@cranky && @standing
            @activities += 1
            cranky?
            return "Twang!!!"
        else
            return "NO!"
        end
    end

    def run
        @standing ? (@activities += 1; cranky?; \
            return "Clop clop clop clop!") : \
            (return "NO!")
    end

    def stand_up
        @standing = true
    end
    
    def standing?
        return @standing
    end

    def cranky?
        if @activities > 2
            @cranky = true
        else
            @cranky = false
        end
        return @cranky
    end

    def lay_down
        @standing = false
    end

    def laying?
        return !@standing
    end

    def sleep
        @standing ? (return "NO!") : \
            (@activities = 0; return "sleeping")
    end

    def drink_potion
        if cranky?
            if @standing
                @cranky = false
                @activities = 0
            end
        else
            @feeling_ill = true
            @activities = 50
        end
    end

    def sick?
        return @feeling_ill
    end


end