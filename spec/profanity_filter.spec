require "spec_helper"

describe ProfanityFilter do

  describe "#direct_match" do
    it "replaces direct matches" do
      expect(ProfanityFilter::Direct.new.sanitize("shit")).to eq "*" * 4
    end
  end

  describe "#concurrent_letters" do
    it "replaces concurrent letters" do
      expect(ProfanityFilter::ConcurrentLetter.new.sanitize("shitt")).to eq "shit"
    end
  end

  describe "#space_replace" do
    it "removes spaces" do
      expect(ProfanityFilter::Space.new.sanitize("s h i t")).to eq "*" * 4
    end
  end

  describe "#symbol_replace" do
    it "replaces symbols with letters" do
      expect(ProfanityFilter::Symbol.new.sanitize("$h!t")).to eq "shit"
    end
  end

  describe "#sanitize" do
    it "filters a whole sentence" do
      sentence = "Dude this fucking shit is dope"
      expected = "Dude this ****ing **** is dope"
      expect(ProfanityFilter.sanitize(sentence)).to eq expected
    end
  end

end
