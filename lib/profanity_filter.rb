require "profanity_filter/version"
require "profanity_filter/words"
require "profanity_filter/symbol"
require "profanity_filter/direct"
require "profanity_filter/concurrent_letter"
require "profanity_filter/space"

module ProfanityFilter

  def self.sanitize(string)

    string = self::ConcurrentLetter.new.sanitize string
    string = self::Direct.new.sanitize string
    string = self::Space.new.sanitize sanitize string
    string = self::Symbol.new.sanitize string

    string
  end

end
