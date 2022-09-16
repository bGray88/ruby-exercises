require "io/console"

class System
    attr_reader :messages_story, :messages_user

    def initialize(input)
        @player_input = input
        @total_encounters = 0
        @messages_user = [
            "Press any key to continue...",
            "During a battle you will need to fight to survive!
            Keep your health points above zero and attack the enemy until their's
            is depleted!
            Press \'k\' to attack
            Press \'p\' for potion"
        ]
        @messages_story = [
            "As you walk along the path on the way home from a hard days work
            you come across a young woman in the middle of the road. She looks
            frightened as you approach her, and her fear seems to grow as you
            get nearer. You attempt to calm her by walking slower, and in your
            most mellow tone call out: \"I'm sorry to disturb you madam. If there
            is any way that I may be of assistance, please let me know.\" 
            Unfortunately, your kind words only seem to have aggravated her further. A 
            foul stench is emanating from her direction, and you can hear loud 
            shrieking noises bellowing from the forest all around you. Luckily, 
            you find an amulet at your feet (Increase Attack Power)\'IT\'S AN 
            ATTACK!!!\'",
            "The story continues..."
        ]
        @battle_actions = [
            "-Battle!-", "-Player Turn-", "*Strike!*", "^Healed!^", "!Empty Slot!"
        ]
        @items = {
            amulets: {"strength" => rand(10..20)},
            potions: {"small"     => 30}
        }
    end

    def battle(char, *enemies)
        @battle_running = true
        @total_encounters == 0 ? print_message(@messages_user[1]) : nil
        
        buff_debuff(char, @items[:amulets]["strength"])
        print_request_key
        print_message(@battle_actions[0])

        while @battle_running
            @next_hit = rand(0...enemies.length)
            @battle_running = battle_turn(char, enemies[@next_hit])
            if enemies[@next_hit].health_pts == 0
                print "#{enemies[@next_hit].name} has been vanquished!!!\n\n"
                enemies.delete(enemies[@next_hit])
            end
            enemies.each do |enemy|
                if enemy.health_pts != 0 && char.health_pts != 0
                    @battle_running = battle_turn(enemy, char)
                end
            end
        end

        @total_encounters += 1
        char.health_pts > 0 ? (return true) : nil
    end

    def battle_turn(giver, reciever)
        if giver.is_a?(Human)
            print_message(@battle_actions[1])
            @player_input.read_input
            process_action(@player_input.process, giver, reciever)
        else
            print_message("#{giver.name} #{@battle_actions[2]}")
            attack(giver, reciever)
        end

        print_status(giver, reciever)
        sleep(2)
        giver.health_pts == 0 || reciever.health_pts == 0 ? (return false) : (return true)
    end

    def process_action(action, actor, bystander)
        case action
        when :attack
            attack(actor, bystander)
            print_message("#{actor.name} #{@battle_actions[2]}")
        when :potion
            if actor.drink_potion(@items[:potions]["small"])
                print_message("#{actor.name} #{@battle_actions[3]}")
            else
                print_message("#{actor.name} #{@battle_actions[4]}")
            end
        end
    end

    def attack(attacker, victim)
        victim.dmg_get(attacker.attack_total)
    end

    def buff_debuff(char, amt)
        char.change_att_mod(amt)
        char.update_att
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
        print_overwrite(@messages_user[0])
        @player_input.read_input
        @player_input.clear_last_input
        print "****************************************\n\n"
    end
end