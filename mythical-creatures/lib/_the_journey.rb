require '../lib/_system'
require '../lib/human'
require '../lib/ogre'

# The story so far...

program = System.new
human = Human.new("Conan")
ogre = Ogre.new("Shrek")

program.print_message(program.messages_story[0])
if program.battle(human, ogre)
    program.print_message(program.messages_story[1])
else
    print "Game Over"
end
