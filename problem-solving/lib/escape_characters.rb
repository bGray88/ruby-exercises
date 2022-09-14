class EscapeCharacters
    def initialize()
        @quotes = "\""
    end

    def quote(phrase)
        phrase.insert(0, @quotes)
        phrase.insert(-1, @quotes)
    end
end