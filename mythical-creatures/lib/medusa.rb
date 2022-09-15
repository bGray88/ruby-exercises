class Medusa
    attr_reader :name, :statues
    def initialize(name)
        @name = name
        @statues = []
        @health_pts = 100
    end

    def stare(person)
        person.spotted()
        statues << person
        if statues.count > 3
            statues[0].released()
            statues.shift
        end
    end
end

class Person
    attr_reader :name
    def initialize(name)
        @name = name
        @stone = false
    end

    def spotted()
        @stone = true
    end

    def released()
        @stone = false
    end

    def stoned?()
        return @stone
    end
end