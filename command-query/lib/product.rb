class Product
    def initialize(name, cost)
        @item = {
            name: name,
            cost: cost
        }
    end

    def get_cost()
        return @item[:cost]
    end

    def category
        return @item[:name]
    end
end