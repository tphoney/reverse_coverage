class StringJoiner
    def self.join(input)
        if input.size == 0
            ""
        else
            input.join(",")
        end
    end
end