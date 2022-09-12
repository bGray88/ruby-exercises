class Student
    def initialize()
        @grades = ['F', 'D', 'C', 'B', 'A']
        @curr_grade_idx = 2
        @curr_grade = @grades[@curr_grade_idx]
    end

    def grade()
        return @curr_grade
    end

    def study()
        update_grade(@curr_grade_idx == 0, 2)
        @curr_grade_idx += 1
        update_grade(@curr_grade_idx > 4, 4)
    end

    def slack_off()
        @curr_grade_idx -= 1
        update_grade(@curr_grade_idx < 0, 0)
    end

    def update_grade(grade_compare, grade_change)
        grade_compare ? @curr_grade_idx = grade_change : nil
        @curr_grade = @grades[@curr_grade_idx]
    end
end