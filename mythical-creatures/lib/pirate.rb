class Pirate
    attr_reader :name, :job

    def initialize(name, job = "Scallywag")
        @name = name
        @job = job
        @felonies = 0
        @booty = 0
        @health_pts = 100
    end

    def cursed?()
        return @felonies > 2
    end

    def commit_heinous_act()
        @felonies += 1
    end

    def has_booty?()
        return @booty > 0
    end

    def rob_ship()
        @booty += 100
    end
end