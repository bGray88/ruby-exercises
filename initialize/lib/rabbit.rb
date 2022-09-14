class Rabbit
    attr_reader

    def initialize(args)
        @name = args[:name]
        @num_syllables = args[:num_syllables]
    end

    def name()
        return @num_syllables == 2 ? @name + " Rabbit" : @name
    end
end