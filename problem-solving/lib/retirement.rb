class Retirement
    def initialize()
        @difference = 0
        @current = 2015
    end

    def calculate(age, retire)
        if age < 0
            return "Error. Age cannot be negative."
        elsif retire < 0
            return "Error. Retirement age cannot be negative."
        else
            @difference = retire - age
            return %W[You have #{@difference} years left until you can retire. 
                    It is 2015, so you can retire in #{@current + @difference}.].join(' ')
        end
    end
end