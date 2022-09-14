class Narwhal
    attr_reader :cute, :weight, :name

    def initialize(animal)
        @cute = animal[:cute]
        @weight = animal[:weight]
        @name = animal[:name]
    end

    def cute?
        return @cute
    end
end