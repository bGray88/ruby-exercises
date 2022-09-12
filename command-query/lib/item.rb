class Item
    def initialize(type, price)
        @item = {
            type: type, 
            price: price[:price],
            discount: price[:discount]
        }
    end

    def get_type()
        return @item[:type]
    end

    def get_price()
        return @item[:price]
    end

    def get_discount()
        return @item[:discount]
    end
end