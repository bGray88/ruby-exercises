require "io/console"

class System
    attr_reader :messages_story, :messages_user

    def initialize ()
        @total_encounters = 0
        @messages_user = [
            "Press any key to continue...",
            "During a battle you will need to fight to survive!
            Keep your health points above zero and attack the enemy until their's
            is depleted!
            Press \'k\' to attack"
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
            "Battle!", "Player Turn", "Strike!"
        ]
        @items = {
            amulets: {"strength" => rand(10..20)}
            potions: {"small     => 30"}
        }
    end

    def battle(char, *enemies)
        @battle_running = true
        @total_encounters == 0 ? print_message(@messages_user[1]) : nil
        
        buff_debuff(char, @items[:amulets]["strength"])
        print_request_key
        print_message(@battle_actions[0])
        while @battle_running
            @battle_running = battle_turn(char, enemies[rand(0...enemies.length)])
            enemies.each do |enemy|
                if enemy.health_pts != 0 && char.health_pts != 0
                    @battle_running = battle_turn(enemy, char)
                end
            end
        end
        @total_encounters += 1
        char.health_pts > 0 ? (return true) : nil
    end

    def battle_turn(actor, other)
        if actor.is_a?(Human)
            print_message(@battle_actions[1])
            press = STDIN.getch
            if press.downcase == 'k'
                attack(actor, other)
                print_message("#{@battle_actions[2]}")
            end
        else
            print_message("#{@battle_actions[2]}")
            attack(actor, other)
        end
        print_status(actor, other)
        sleep(2)
        actor.health_pts == 0 || other.health_pts == 0 ? (return false) : (return true)
    end

    def attack(attacker, victim)
        victim.dmg_get(attacker.attack_total)
    end

    def buff_debuff(char, amt)
        char.change_att_mod(amt)
        char.update_att
    end

    def print_message(request)
        print %W[#{request}\n].join(' ')
    end

    def print_status(char, enemy)
        print %W[#{char.name}:  #{char.health_pts}\n
                 #{enemy.name}: #{enemy.health_pts}\n\n].join(' ')
    end

    def print_request_key
        print @messages_user[0]
        STDIN.getch
        print ".......................\r"
    end
end