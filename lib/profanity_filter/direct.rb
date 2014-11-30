module ProfanityFilter
  class Direct
    def sanitize(string)
      @@words.each do |word|
        string = string.gsub(word, "*" * word.length)
      end

      string
    end
  end
end
