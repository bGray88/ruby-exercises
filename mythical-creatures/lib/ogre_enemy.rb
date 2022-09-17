class OgreEnemy
    attr_reader :name, :home, :swings, :encounter_counter, :health_pts, 
    :attack_total, :status
    def initialize(name, home = "Swamp", att_mod = rand(1..2))
        @name = name
        @home = home
        @status = :alive
        @swings = 0
        @encounter_counter = 0
        @health_pts = 100
        @health_max = 100
        @attack_mod = att_mod
        @attack_crit = 2
        @attack_pow = 2
        @attack_max = 3 + @attack_mod
        @attack_total = 0
    end

    def strike
        return @attack_total = rand(1...@attack_crit) * rand(@attack_pow...@attack_max)
    end

    def update_att_pow(pow_mod)
        @attack_pow += pow_mod
        update_att_crit((@attack_pow/2).to_i)
    end

    def update_att_mod(mod_mod)
        @attack_mod = mod_mod
        update_att_max(@attack_mod)
    end

    def update_att_max(max_mod)
        @attack_max += max_mod
    end

    def update_att_crit(crit_mod)
        @attack_crit += crit_mod
    end

    def dmg_get(amt)
        @health_pts -= amt
        @health_pts < 0 ? @health_pts = 0 : nil
    end

    def change_status(update)
        @status = update
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