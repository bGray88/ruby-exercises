class Direwolf
    attr_reader :name, :home, :size, :starks_to_protect
    def initialize(name, home = "Beyond the Wall", size = "Massive")
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
    end

    def protects(humanoid)
        if @home == humanoid.location
            if @starks_to_protect.count < 2
                humanoid.safe = true
                @starks_to_protect << humanoid
            end
        end
    end

    def hunts_white_walkers?
        @starks_to_protect.count == 0 ? (return true) : (return false)
    end

    def leaves(humanoid)
        humanoid.safe = false
        @starks_to_protect.delete(humanoid)
    end
end

class Stark
    attr_reader :name, :location, :house_words
    attr_writer :safe

    def initialize(name, location = "Winterfell")
        @name = name
        @location = location
        @safe = false
        @house_words = "Winter is Coming"
    end

    def safe?
        return @safe
    end
end