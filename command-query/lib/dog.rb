class Dog
    def initialize()
        @hungry = true
    end

    def hungry?()
        return @hungry
    end

    def eat()
        @hungry = false
    end
end