class RollCall
    def initialize
        @student_names = []
    end

    def <<(name)
        @student_names << name
    end

    def longest_name
        return @student_names.max_by(&:length)
    end
end