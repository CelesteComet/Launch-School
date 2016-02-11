class InvalidCodonError < StandardError
end

class Translation

  CODON_DICT = {
    'Methionine' => ["AUG"],
    'Phenylalanine' => ["UUU", "UUC"],
    'Leucine' => ["UUA", "UUG"],
    'Serine' => ["UCU", "UCC", "UCA", "UCG"],
    'Tyrosine' => ["UAU", "UAC"],
    'Cysteine' => ["UGU", "UGC"],
    'Tryptophan' => ["UGG"],
    'STOP' => ["UAA", "UAG", "UGA"]
  }

  def self.get_answer(string)
    arr_of_codons = string.scan(/.../).map do |codon|
      raise InvalidCodonError if codon[/[^UAGC]+/]
      name = nil 
      CODON_DICT.each do |full_name, associated_codons|
        name = full_name if associated_codons.index(codon)
      end
      codon = name
    end
    if arr_of_codons.length == 1 
      arr_of_codons.first  
    elsif arr_of_codons.index("STOP")
      arr_of_codons.slice(0..arr_of_codons.index("STOP")-1)
    else
      arr_of_codons
    end    
  end

  def self.of_codon(string)
    self.get_answer(string)
  end

  def self.of_rna(string)
    self.get_answer(string)
  end
end