class Bag
    attr_reader :count, :candies

    def initialize()
        @empty = true
        @count = 0
        @taken = []
        @candies = []
    end

    def empty?
        @count == 0 ? @empty = true : @empty = false
        return @empty
    end

    def <<(candy)
        @candies << candy
        @count += 1
    end

    def contains?(type)
        candies.each do |candy|
            return candy.type.include?(type)
        end
    end

    def take(number = 0)
        @count -= number
        @taken = candies.pop(number)
        number > 1 ? @taken : @taken[0]
    end

    def eat()
        @count -= 1
        return @candies.pop.sugar
    end

    def grab(type)
        @count -= 1
        @grabbed = ""
        candies.each_with_index do |candy, index|
            if type == candy.type
                @grabbed = candies[index]
                candies.delete_at(index)
                break
            end
        end
        return @grabbed
    end
end