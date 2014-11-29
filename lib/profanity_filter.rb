require "profanity_filter/version"

module ProfanityFilter

  @@original_string = ""
  @@str = ""
  @@words = [
    "shit",
    "fuck",
  ]
  @@spaces = /(\s{1,}|\-{1,}|\_{1,}|\|{1,})/
  @@symbols = ["$","!"]
  @@letters = ["s","i"]

  def self.sanitize(string)
    @@str = string

    self.concurrent_letters
    self.direct_match
    self.space_replace
    self.symbol_replace

    @@str
  end

  def self.concurrent_letters
    individual_words = @@str.split(" ")

    individual_words.each_with_index do |word, index|
      replaced = word.gsub(/(.)\1+/, "\\1")

      if @@words.include? replaced
        @@str = @@str.gsub(word, replaced)
      end

      lengths = @@words.map{ |w| w.length }

      if word.length < lengths.min
        spaced_word = "#{individual_words[index - 1]}#{word}#{individual_words[index + 1]}"
        spaced_word = spaced_word.gsub(" ", "")
        replaced = spaced_word.gsub(/(.)\1+/, "\\")

        if @@words.include? replaced
          @@str = @@str.gsub(spaced_word, "*" * replaced.length)
        end
      end
    end
  end

  def self.direct_match
    @@words.each do |word|
      @@str = @@str.gsub(word, "*" * word.length)
    end
  end

  def self.space_replace
    @@str = @@str.gsub(@@spaces, "-")

    @@words.each do |word|
      letters = word.split(//)
      dashed = letters.join("-")

      @@str = @@str.gsub(dashed, "*" * word.length)
    end

    @@str = @@str.gsub("-", " ")
  end

  def self.symbol_replace
    @@symbols.each_with_index do |symbol, index|
      @@str = @@str.gsub(symbol, @@letters[index])

      @@words.each do |word|
        @@str = @@str.gsub(word, "*" * word.length)
      end
    end
  end

end
