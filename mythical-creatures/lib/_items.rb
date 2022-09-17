class Items
    @@items_health = {
        potions: {small:    30,
                  medium:   50,
                  large:    100}
    }
    @@items_accessory = {
        amulets: {strength: rand(10..20),
                  magic:    rand(10..20),
                  speed:    rand(10..20)}
    }

    def Items.hlth_itm(item_type, item_size)
        return @@items_health[item_type][item_size]
    end

    def Items.acc_itm(item_type, item_attr)
        return @@items_accessory[item_type][item_attr]
    end
end