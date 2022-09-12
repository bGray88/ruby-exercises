class Floor
    def initialize
        @clean = false
    end

    def dirty?
        return !@clean
    end

    def wash
        @clean = true
    end
end