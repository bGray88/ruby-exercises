class Children
    def initialize()
        @all_children = []
        @all_ages = []
    end

    def eldest()
        if !@all_children.empty?
            @all_ages = @all_children.map(&:age)
            return @all_children[@all_ages.index(@all_ages.max)]
        end
    end

    def <<(child)
        @all_children << child
    end

    def name()
        return @all_children
    end
end