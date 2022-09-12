class Catalog
    def initialize()
        @inventory = []
        @low_price = nil
        @cost_level = proc {|item| item.get_cost}
    end

    def <<(item)
        if @low_price.nil?
            @low_price = item
        else
            if check_cost(item, @low_price)
                @low_price = item
            end
        end
        @inventory << item
    end

    def cheapest()
        !@low_price.nil? ? (return @low_price.category) : (return nil)
    end

    def check_cost(item_test, low_item)
        return @cost_level.call(item_test) < @cost_level.call(low_item)
    end
end