require '../lib/ogre'

class Human
    attr_reader :name, :encounter_counter, :health_pts, :attack_pow
    def initialize(name = "Jane")
        @name = name
        @encounter_counter = 0
        @health_pts = 100
        @attack_pow = 10
    end

    def dmg_get(amt)
        @health_pts -= amt
    end

    def drink_potion(size)
        @health_pts += size
    end

    def encounter
        @encounter_counter += 1
    end

    def notices_ogre?
        return @encounter_counter % 3 == 0
    end

    def knocked_out?
        return @encounter_counter > 5
    end

    def apologized
        @encounter_counter = 0
    end
end