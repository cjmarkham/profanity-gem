module ProfanityFilter
  class ConcurrentLetter
    def sanitize(string)

      string.split(" ").each_with_index do |word, index|
        replaced = word.gsub(/(.)\1+/, "\\1")

        string = string.gsub(word, replaced) if @@words.include? replaced

        lengths = @@words.map{ |w| w.length }

        if word.length < lengths.min
          spaced_word = "#{individual_words[index - 1]}#{word}#{individual_words[index + 1]}".gsub(" ", "")
          replaced = spaced_word.gsub(/(.)\1+/, "\\")
        end
      end

      string
    end
  end
end
