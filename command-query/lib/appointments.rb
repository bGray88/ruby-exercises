class Appointments
    def initialize()
        @app_list = []
        @earliest = nil
    end

    def earliest()
        if !@app_list.empty?
            @earliest = @app_list[0]
            @app_list.each do |time| 
                time < @earliest ? @earliest = time : nil
            end
        end
        return @earliest
    end

    def at(time)
        @app_list << time
    end
end