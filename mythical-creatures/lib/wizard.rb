class Wizard
    attr_reader :name

    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @cast = 0
        @health_pts = 100
    end

    def bearded?()
        return @bearded
    end

    def incantation(phrase)
        return "sudo " + phrase
    end

    def cast()
        @cast += 1
        return "MAGIC MISSILE!"
    end

    def rested?()
        return @cast < 3
    end
end