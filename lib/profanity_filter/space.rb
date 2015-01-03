module ProfanityFilter
  class Space

    def sanitize(string)
      string = string.gsub(/(\s{1,}|\-{1,}|\_{1,}|\|{1,})/, "-")

      @@words.each do |word|
        dashed = word.split(//).join("-")
        string = string.gsub(dashed, "*" * word.length)
      end

      string.gsub("-", " ")
    end
  end
end
