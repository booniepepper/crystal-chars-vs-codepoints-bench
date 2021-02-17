NUCLEOTIDES = "ACGT"

def write_a_billion_dna(filename : String)
  (1..1_000_000).each do |_|
    dna = (1..1_000).map{ |_| NUCLEOTIDES[Random.rand(0..3)] }.join
    File.write(filename, dna, mode: "a")
  end
end

write_a_billion_dna "a.txt"
write_a_billion_dna "b.txt"

