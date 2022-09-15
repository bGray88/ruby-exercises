class Werewolf
    attr_reader :name, :location

    def initialize(name, location = "London")
        @name = name
        @location = location
        @type = [{human: true, hungry: false, eat: "Yuck!"}, \
                 {human: false, hungry: true, eat: "Yum!"}]
        @type_sel = [0, 1]
        @curr_type = @type_sel[0]
        @state = @type[@curr_type]
        @health_pts = 100
    end

    def human?
        return @state[:human]
    end

    def change!
        @type_sel = @type_sel.reverse
        @curr_type = @type_sel[0]
        @state = @type[@curr_type]
    end

    def wolf?
        return !@state[:human]
    end

    def is_hungry?
        return @state[:hungry]
    end

    def eat(person)
        eat = @state[:eat]
        if eat == "Yum!"
            person.eaten()
            @state[:hungry] = false
            @state[:eat] = "Yuck!"
        end
        return eat
    end
end