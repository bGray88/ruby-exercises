class Bag
    attr_reader :count, :candies

    def initialize()
        @empty = true
        @count = 0
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
            if candy.type.include?(type)
                return true
            else
                return false
            end
        end
    end

    def eat(number = 1)
        @count -= number
    end
end