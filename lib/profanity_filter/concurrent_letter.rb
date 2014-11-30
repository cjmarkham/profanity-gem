module ProfanityFilter
  class ConcurrentLetter
    def sanitize(string)
      individual_words = string.split(" ")

      individual_words.each_with_index do |word, index|
        replaced = word.gsub(/(.)\1+/, "\\1")

        if @@words.include? replaced
          string = string.gsub(word, replaced)
        end

        lengths = @@words.map{ |w| w.length }

        if word.length < lengths.min
          spaced_word = "#{individual_words[index - 1]}#{word}#{individual_words[index + 1]}"
          spaced_word = spaced_word.gsub(" ", "")
          replaced = spaced_word.gsub(/(.)\1+/, "\\")
        end
      end

      string
    end
  end
end
