module ProfanityFilter
  class Space

    @@spaces = /(\s{1,}|\-{1,}|\_{1,}|\|{1,})/

    def sanitize(string)
      string = string.gsub(@@spaces, "-")

      @@words.each do |word|
        letters = word.split(//)
        dashed = letters.join("-")

        string = string.gsub(dashed, "*" * word.length)
      end

      string.gsub("-", " ")
    end
  end
end
