require "profanity_filter/version"

module ProfanityFilter

  @@words = [
    "shit",
    "fuck",
  ]
  @@spaces = /(\s{1,}|\-{1,}|\_{1,}|\|{1,})/
  @@symbols = ["$","!"]
  @@letters = ["s","i"]

  def self.sanitize(string)

    string = self.concurrent_letters string
    string = self.direct_match string
    string = self.space_replace string
    string = self.symbol_replace string

    string
  end

  def self.concurrent_letters(string)
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

  def self.direct_match(string)
    @@words.each do |word|
      string = string.gsub(word, "*" * word.length)
    end

    string
  end

  def self.space_replace(string)
    string = string.gsub(@@spaces, "-")

    @@words.each do |word|
      letters = word.split(//)
      dashed = letters.join("-")

      string = string.gsub(dashed, "*" * word.length)
    end

    string.gsub("-", " ")
  end

  def self.symbol_replace(string)
    @@symbols.each_with_index do |symbol, index|
      string = string.gsub(symbol, @@letters[index])
    end

    string
  end

end
