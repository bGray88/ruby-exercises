require '../lib/_system'
require '../lib/_input'
require '../lib/human'
require '../lib/ogre'

# The story so far...

input = Input.new
program = System.new(input)
human = Human.new("Conan")
ogre1 = Ogre.new("Shrek")
ogre2 = Ogre.new("Chok")
ogre3 = Ogre.new("Pfaff")

program.print_message(program.messages_story[0])
if program.battle(human, ogre1, ogre2, ogre3)
    program.print_message(program.messages_story[1])
else
    print "Game Over"
end
