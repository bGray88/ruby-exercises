class Cupcakes
    def initialize()
        @box = []
        @high_sugar = nil
        @sugar_level = proc {|cake| cake.get_sugar}
    end

    def <<(cake)
        if @high_sugar.nil?
            @high_sugar = cake
        else
            check_sugar(cake, @high_sugar) ? @high_sugar = cake : nil
        end
        @box << cake
    end

    def check_sugar(cake_test, high_cake)
        return @sugar_level.call(cake_test) > @sugar_level.call(high_cake)
    end

    def sweetest()
        return @high_sugar
    end
end