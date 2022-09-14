class MadLib

    def initialize()
        @noun = ""
        @verb = ""
        @adjective = ""
        @adverb = ""
    end

    def result()
        %W[Do you #{@verb} your #{@adjective} 
           #{@noun} #{@adverb}? That's hilarious!].join(' ')
    end

    def noun(word)
        @noun = word
    end

    def verb(word)
        @verb = word
    end

    def adjective(word)
        @adjective = word
    end

    def adverb(word)
        @adverb = word
    end
end