require '../lib/ogre'

class Human
    attr_reader :name, :encounter_counter, :health_pts, :attack_total
    def initialize(name = "Jane")
        @name = name
        @encounter_counter = 0
        @health_pts = 100
        @health_max = 100
        @attack_mod = 0
        @attack_pow = 20
        @attack_total = 0
        @potions = {"small" => 3}
    end

    def dmg_get(amt)
        @health_pts -= amt
        @health_pts < 0 ? @health_pts = 0 : nil
    end

    def change_att_mod(modifier)
        @attack_mod += modifier
    end

    def update_att
        @attack_total = @attack_mod + @attack_pow
    end

    def drink_potion(size)
        if @potions["small"] != 0
            @health_pts += size
            @health_pts > @health_max ? @health_pts = @health_max : nil
            @potions["small"] -= 1
            return true
        else
            return false
        end
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