class Ogre
    attr_reader :name, :home, :swings, :encounter_counter
    def initialize(name, home = "Swamp")
        @name = name
        @home = home
        @swings = 0
        @encounter_counter = 0
    end

    def encounter(humanoid)
        @encounter_counter += 1
        humanoid.encounter
        if humanoid.notices_ogre?
            swing_at(humanoid)
        end
    end

    def swing_at(humanoid)
        @swings += 1
    end

    def apologize(humanoid)
        humanoid.apologized
    end
end

class Human
    attr_reader :name, :encounter_counter
    def initialize(name = "Jane")
        @name = name
        @encounter_counter = 0
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