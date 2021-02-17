require "option_parser"

codepoints = false

OptionParser.parse do |parser|
  parser.on "-c", "--codepoints", "Use codepoints instead of chars" do
    codepoints = true
  end
end

a = File.read("a.txt")
b = File.read("b.txt")

pairs = codepoints ? a.codepoints.zip(b.codepoints) : a.chars.zip(b.chars)

puts pairs.select{|pair| pair[0] != pair[1]}.size

