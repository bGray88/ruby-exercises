require "io/console"
require "../lib/_messages"
require "../lib/_items"

class System
    def initialize(input)
        @player_input = input
    end

    def battle(char, enemies)
        @battle_running = true
        @victory = false
        char[0].encounter_counter == 0 ? print_message(Messages.usr_msgs(1)) : nil
        
        buff_debuff(char[0], Items.acc_itm(:amulets, :strength))
        print_request_key
        print_message(Messages.btl_msgs(0))

        while @battle_running
            battle_turn(char[0], enemies[char[0].next_hit(enemies)])
            if enemies[char[0].next_hit_idx].health_pts == 0
                enemy_death(enemies, char[0].next_hit_idx)
            end
            enemies.each do |enemy|
                if enemy.status != :dead && char[0].status != :dead
                    battle_turn(enemy, char[0])
                end
            end
            if char[0].status == :dead
                @battle_running = false
                char_death(char[0])
            elsif enemies.empty?
                @battle_running = false
                @victory = true
            end
        end

        char[0].encounter
        return @victory
    end

    def battle_turn(giver, reciever)
        if giver.is_a?(HumanPlayer)
            print_message(Messages.btl_msgs(1))
            @player_input.read_input
            process_action(@player_input.process, giver, reciever)
        else
            print_message("#{giver.name} #{Messages.btl_msgs(2)}")
            attack(giver, reciever)
        end

        reciever.health_pts == 0 ? reciever.change_status(:dead) : nil
        print_status(giver, reciever)
        sleep(2)
    end

    def process_action(action, actor, bystander)
        case action
        when :attack
            attack(actor, bystander)
            print_message("#{actor.name} #{Messages.btl_msgs(2)}")
        when :potion
            if actor.use_item(:potions, :small)
                print_message("#{actor.name} #{Messages.btl_msgs(3)}")
            else
                print_message("#{actor.name} #{Messages.btl_msgs(4)}")
            end
        end
    end

    def attack(attacker, victim)
        victim.dmg_get(attacker.strike)
    end

    def char_death(char)
        print_message(Messages.usr_msgs(2))
    end

    def enemy_death(enemies, att_idx)
        print_message("#{enemies[att_idx].name} has been vanquished!!!\n")
        enemies.delete(enemies[att_idx])
    end

    def buff_debuff(char, amt)
        char.update_att_mod(amt)
    end

    def print_message(message)
        print %W[#{message}\n].join(' ')
    end

    def print_status(char, enemy)
        print %W[#{char.name}:  #{char.health_pts}\n
                 #{enemy.name}: #{enemy.health_pts}\n\n].join(' ')
    end

    def print_overwrite(message)
        print %W[#{message}\r].join(' ')
    end

    def print_request_key
        print_overwrite(Messages.usr_msgs(0))
        @player_input.read_input
        @player_input.clear_last_input
        print "****************************************\n\n"
    end
end