class Lovisa
    attr_reader :title, :characteristics

    def initialize(title, characteristics = ["brilliant"])
        @title = title
        @characteristics = characteristics
    end

    def brilliant?
        return @characteristics.include?("brilliant")
    end

    def kind?
        return @characteristics.include?("kind")
    end

    def say(phrase)
        "**;* " + phrase + " **;*"
    end
end