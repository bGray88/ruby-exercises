class Messages
    @@messages_user = [
        "Press any key to continue...",
        "During a battle you will need to fight to survive!
        Keep your health points above zero and attack the enemy until their's
        is depleted!
        Press \'k\' to attack
        Press \'p\' for potion",
        "Player has been vanquished!"
    ]
    @@messages_story = [
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
    @@battle_actions = [
        "-Battle!-", "-Player Turn-", "*Strike!*", "^Healed!^", "!Empty Slot!"
    ]

    def Messages.usr_msgs(msg_idx)
        return @@messages_user[msg_idx]
    end

    def Messages.stry_msgs(msg_idx)
        return @@messages_story[msg_idx]
    end
    def Messages.btl_msgs(msg_idx)
        return @@battle_actions[msg_idx]
    end
end