class String
  def anagrams(words, &block)
    words.select do |word|
      downcase.chars.sort == word.downcase.chars.sort and word != self
    end.each &block
  end
end
