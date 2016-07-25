BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  BLOCKS.any? { |block| string.count(block) >= 2 } ? false : true
end

print block_word?("BATCH")
print block_word?("BUTCH")