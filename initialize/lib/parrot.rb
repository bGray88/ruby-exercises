class Parrot
    attr_reader :name, :known_words, :sound

    def initialize(args)
        @name = args[:name]
        @known_words = args[:known_words]
        @sound = "Squawk!"
    end
end