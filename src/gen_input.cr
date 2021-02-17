NUCLEOTIDES = "ACGT"

def write_much_dna(filename : String)
  (1..100_000).each do |_|
    dna = (1..1_000).map{ |_| NUCLEOTIDES[Random.rand(0..3)] }.join
    File.write(filename, dna, mode: "a")
  end
end

write_much_dna "a.txt"
write_much_dna "b.txt"

