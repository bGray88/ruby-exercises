class Ogre
    attr_reader :name, :home, :swings, :encounter_counter, :health_pts, 
    :attack_total
    def initialize(name, home = "Swamp", att_mod = 3)
        @name = name
        @home = home
        @swings = 0
        @encounter_counter = 0
        @health_pts = 100
        @health_max = 100
        @attack_mod = att_mod
        @attack_pow = 5
        @attack_total = @attack_mod + @attack_pow
    end

    def dmg_get(amt)
        @health_pts -= amt
        @health_pts < 0 ? @health_pts = 0 : nil
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