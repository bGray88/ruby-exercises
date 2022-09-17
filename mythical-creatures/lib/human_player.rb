require '../lib/ogre_enemy'
require '../lib/_items'

class HumanPlayer
    attr_reader :name, :encounter_counter, :health_pts, :attack_total,
    :status, :next_hit_idx
    def initialize(name = "Jane")
        @name = name
        @status = :alive
        @encounter_counter = 0
        @next_hit_idx = 0
        @health_pts = 100
        @health_max = 100
        @attack_pow = 10
        @attack_max = 15
        @attack_mod = 0
        @attack_crit = 2
        @attack_total = 0
        @items = {
            potions: {small: 3,
                      medium: 0,
                      large: 0}
        }
    end

    def next_hit(enemy_arr)
        @next_hit_idx = rand(0...enemy_arr.length)
        return @next_hit_idx
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

    def use_item(type, size)
        if !@items.empty? && @items[type][size] != 0
            case type
            when :potions
                @health_pts += Items.hlth_itm(type, size)
                @health_pts > @health_max ? @health_pts = @health_max : nil
                @items[type][size] -= 1
                return true
            end
        else
            return false
        end
    end

    def change_status(update)
        @status = update
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