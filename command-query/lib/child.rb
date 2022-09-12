class Child
    def initialize(name, age)
        @child = {name: name,
                   age: age}
    end

    def name()
        return @child[:name]
    end

    def age()
        return @child[:age]
    end
end