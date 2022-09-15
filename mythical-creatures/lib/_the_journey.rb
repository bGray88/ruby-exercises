require '../lib/_system'
require '../lib/human'
require '../lib/ogre'

# The story so far...

program = System.new
human = Human.new("Conan")
ogre = Ogre.new("Shrek")

program.print_message(program.messages[0])
program.battle(human, ogre)
