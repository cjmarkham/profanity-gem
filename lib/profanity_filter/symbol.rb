module ProfanityFilter
  class Symbol

    @@symbols = ["$","!"]
    @@letters = ["s","i"]

    def sanitize(string)
      @@symbols.each_with_index do |symbol, index|
        string = string.gsub(symbol, @@letters[index])
      end

      string
    end
  end
end
