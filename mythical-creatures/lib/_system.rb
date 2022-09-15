class System
    attr_reader :messages
    def initialize ()
        @total_encounters = 0
        @messages = [
            "As you walk along the path on the way home from a hard days work
            you come across a young woman in the middle of the road. She looks
            frightened as you approach her, and her fear seems to grow as you
            get nearer. You attempt to calm her by walking slower, and in your
            most mellow tone call out: \"I'm sorry to disturb you madam. If there
            is any way that I may be of assistance, please let me know.\" 
            Unfortunately, your kind words only seem to have agrivated her further. A 
            foul stench is eminating from her direction, and you can hear loud 
            shrieking noises bellowing from the forest all around you. \'IT\'S AN 
            ATTACK!!!\'",
            "During a battle you will need to fight to survive!
            Keep your health points above zero and attack the enemy until their's
            is depleted!"
        ]
        @battle_actions = ["Battle!", "Strike!"]
    end

    def battle(char, enemy)
        @total_encounters == 0 ? print_message(messages[1]) : nil
        print_message(@battle_actions[0])
        sleep(5)
        while char.health_pts > 0 && enemy.health_pts > 0
            enemy.dmg_get(char.attack_pow)
            print_message("Player: #{@battle_actions[1]}")
            char.dmg_get(enemy.attack_pow)
            print_message("Enemy: #{@battle_actions[1]}")
            print_status(char, enemy)
            sleep(3)
        end
    end

    def print_message(request)
        print %W[#{request}\n].join(' ')
    end

    def print_status(char, enemy)
        print %W[Character Health: #{char.health_pts}\n
                 Enemy Health:     #{enemy.health_pts}\n\n].join(' ')
    end
end