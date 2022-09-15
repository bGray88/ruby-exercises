class Ogre
    attr_reader :name, :home, :swings, :encounter_counter, :health_pts, :attack_pow
    def initialize(name, home = "Swamp")
        @name = name
        @home = home
        @swings = 0
        @encounter_counter = 0
        @health_pts = 100
        @attack_pow = 8
    end

    def dmg_get(amt)
        @health_pts -= amt
    end

    def encounter(humanoid)
        @encounter_counter += 1
        humanoid.encounter
        if humanoid.notices_ogre?
            swing_at(humanoid)
        end
    end

    def swing_at(humanoid)
        @swings += 1
    end

    def apologize(humanoid)
        humanoid.apologized
    end
end