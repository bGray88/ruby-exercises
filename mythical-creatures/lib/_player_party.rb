class PlayerParty
    attr_reader :members

    def initialize(members)
        @encounter_counter = 0
        @members = members
    end

    def encounter
        @encounter += 1
    end

    def print_members
        p @members
    end
end