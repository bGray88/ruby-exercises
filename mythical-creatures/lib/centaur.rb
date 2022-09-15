class Centaur
    attr_reader :name, :breed
    def initialize(name, breed)
        @name = name
        @breed = breed
        @standing = true
        @cranky = false
        @activities = 0
        @CRANK_FACTOR = 3
        @feeling_ill = false
        @health_pts = 100
    end

    def shoot
        return check_status("Twang!!!", "NO!", @activities += 1, !cranky? && standing?)
    end

    def run
        return check_status("Clop clop clop clop!", "NO!", @activities += 1, standing?)
    end

    def stand_up
        @standing = true
    end
    
    def standing?
        return @standing
    end

    def cranky?
        @activities >= @CRANK_FACTOR ? @cranky = true : nil
        return @cranky
    end

    def lay_down
        @standing = false
    end

    def laying?
        return !standing?
    end

    def sleep
        return check_status("sleeping", "NO!", fully_rested, !standing?)
    end

    def drink_potion
        if cranky?
            if standing?
                fully_rested
            end
        else
            @feeling_ill = true
            @activities = @CRANK_FACTOR
        end
    end

    def sick?
        return @feeling_ill
    end

    def fully_rested
        @activities = 0
        @feeling_ill = false
        @cranky = false
    end

    def check_status(pos_msg, neg_msg, stat_update, stat_chk)
        stat_chk ? (stat_update; (return pos_msg)) : (return neg_msg)
    end
end