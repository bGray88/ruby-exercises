class Clearance
    def initialize()
        @items = []
        @curr_disc = nil
        @high_disc = nil
        @disc_perc_get = proc {|item| item.get_discount / item.get_price.to_f}
    end

    def <<(item)
        if @high_disc.nil?
            @curr_disc = @disc_perc_get.call(item)
            @high_disc = item
        else
            if check_discount(item, @high_disc)
                @high_disc = item
            end
        end
        @items << item
    end

    def best_deal()
        !@high_disc.nil? ? (return @high_disc.get_type) : (return nil)
    end

    def check_discount(discount_test, high_disc)
        return @disc_perc_get.call(discount_test) > @disc_perc_get.call(high_disc)
    end
end