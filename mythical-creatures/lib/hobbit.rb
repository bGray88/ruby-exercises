class Hobbit
    attr_reader :name, :disposition, :age
    def initialize(name, disp = "homebody")
        @name = name
        @disposition = disp
        @age = 0
        @health_pts = 100
    end
    def celebrate_birthday()
        @age += 1
    end

    def adult?()
        return @age > 32
    end

    def has_ring?()
        return @name == "Frodo"
    end

    def is_short?()
        return true
    end
end