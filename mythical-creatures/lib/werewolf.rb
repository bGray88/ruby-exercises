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
    end

    def human?
        return @state[:human]
    end

    def change!
        @state = @type[@curr_type]
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
        @state[:hungry] = false
        @state[:eat] = "Yuck!"
        person.eaten()
        return eat
    end
end