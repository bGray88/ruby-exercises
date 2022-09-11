class Unicorn
    attr_reader :name, :color

    def initialize(name, color = "silver")
        @name = name
        @color = color
    end

    def silver?()
        return @color == "silver"
    end

    def say(phrase)
        return "**;* " + phrase + " **;*"
    end
end