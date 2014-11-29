require "spec_helper"

describe ProfanityFilter do

  it "replaces direct matches" do
    expect(ProfanityFilter.sanitize("shit")).to eq "*" * 4
  end

  it "replaces concurrent letters" do
    expect(ProfanityFilter.sanitize("shitt")).to eq "*" * 4
  end

  it "removes spaces" do
    expect(ProfanityFilter.sanitize("s h i t")).to eq "*" * 4
  end

  it "replaces symbols with letters" do
    expect(ProfanityFilter.sanitize("$h!t")).to eq "*" * 4
  end

  it "filters a whole sentence" do
    sentence = "Dude this fucking shit is dope"
    expected = "Dude this ****ing **** is dope"
    expect(ProfanityFilter.sanitize(sentence)).to eq expected
  end

end
