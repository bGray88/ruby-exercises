class Tire
    def initialize
        @status = "filled"
    end

    def flat?
        return @status == "flat"
    end

    def blow_out
        @status = "flat"
    end
end