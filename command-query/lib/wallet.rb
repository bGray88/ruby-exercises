class Wallet
    def initialize()
        @purse = {
            penny: [1, 0],
            nickel: [5, 0],
            dime: [10, 0],
            quarter: [25, 0]
        }
    end

    def <<(coin)
        @purse[coin][1] += 1
    end

    def cents()
        return @purse.sum {|key, value| value[0] * value[1]}
    end

    def take(*coins)
        coins.each do |coin|
            @purse[coin][1] > 0 ? @purse[coin][1] -= 1 : nil
        end
    end
end