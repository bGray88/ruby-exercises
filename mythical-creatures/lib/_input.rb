class Input
    def initialize
        @press = nil
    end

    def read_input()
        @press = STDIN.getch
    end

    def process()
        case @press.downcase
        when 'k'
            return :attack
        when 'p'
            return :potion
        else
            return :unknown
        end
        clear_last_input
    end

    def clear_last_input()
        @press = nil
    end
end