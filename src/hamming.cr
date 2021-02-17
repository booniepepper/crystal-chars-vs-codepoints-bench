require "option_parser"

codepoints = nil

OptionParser.parse do |parser|
  parser.on "-c", "--chars", "Use chars" do
    codepoints = false
  end
  parser.on "-C", "--codepoints", "Use codepoints" do
    codepoints = true
  end
end

a = File.read("a.txt")
b = File.read("b.txt")

pairs = codepoints ? a.codepoints.zip(b.codepoints) : a.chars.zip(b.chars)

puts pairs.select{|pair| pair[0] != pair[1]}.size

