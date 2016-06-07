class DNA

  def initialize(strand)
    @strand = strand 
  end

  def hamming_distance(comparison_strand) 
    # length = [@strand.length, comparison_strand].min
    length = shorter_strand(comparison_strand).length
    hamming_distance = 0

    length.times do |index|
      if @strand[index] != comparison_strand[index]
        hamming_distance += 1
      end
    end
    hamming_distance
  end

  def shorter_strand(comparison_strand)
    @strand.length <= comparison_strand.length ? @strand : comparison_strand
  end
end

