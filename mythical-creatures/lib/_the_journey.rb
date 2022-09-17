require '../lib/_system'
require '../lib/_input'
require '../lib/_messages'
require '../lib/human_player'
require '../lib/wizard_player'
require '../lib/hobbit_player'
require '../lib/ogre_enemy'
require '../lib/_player_party'

# The story so far...

input = Input.new
program = System.new(input)
human1 = HumanPlayer.new("Conan")
human2 = WizardPlayer.new("Merlin")
human3 = HobbitPlayer.new("Pippin")
ogre1 = OgreEnemy.new("Shrek")
ogre2 = OgreEnemy.new("Chok")
ogre3 = OgreEnemy.new("Pfaff")

player_party = PlayerParty.new([human1, human2, human3])
enemy_party = [ogre1, ogre2, ogre3]

program.print_message(Messages.stry_msgs(0))
if program.battle(player_party.members, enemy_party)
    program.print_message(Messages.stry_msgs(1))
else
    print "Game Over"
end
