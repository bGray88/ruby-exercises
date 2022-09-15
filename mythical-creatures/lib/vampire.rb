class Vampire
    attr_reader :name, :pet, :thirsty

    def initialize(name, pet = "bat")
        @name = name
        @pet = pet
        @thirsty = true
        @health_pts = 100
    end

    def drink()
        @thirsty = false
    end
end