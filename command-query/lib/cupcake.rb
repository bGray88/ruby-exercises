class Cupcake
    def initialize(type, sugar)
        @cake = {type: type,
                 sugar: sugar}
    end

    def flavor()
        return @cake[:type]
    end

    def get_cake
        return @cake
    end
end