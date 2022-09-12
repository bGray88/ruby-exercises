class Cupcakes
    def initialize()
        @box = []
        @high_sugar = nil
        @sugar_level = proc {|cake| cake.get_cake[:sugar]}
    end

    def <<(cake)
        if @high_sugar.nil?
            @high_sugar = cake
        else
            check_sugar(cake, @high_sugar)
        end
        @box << cake
    end

    def check_sugar(cake_test, high_cake)
        if @sugar_level.call(cake_test) > @sugar_level.call(high_cake)
            @high_sugar = cake_test
        end
    end

    def sweetest()
        return @high_sugar
    end
end