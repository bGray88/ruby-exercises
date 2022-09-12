class Santa
    def initialize
        @girth = 0
        @TOO_FAT = 3
    end

    def fits?
        return @girth < @TOO_FAT
    end

    def eats_cookies
        @girth += 1
    end
end