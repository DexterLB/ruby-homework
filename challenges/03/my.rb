class String
  def word_wrap(chars_per_row)
    row = ''
    wrapped = []
    split.each do |word|
      if (row + word).length + 1 > chars_per_row
        wrapped << row unless row.empty?
        row = word
      else
        row += ' ' unless row.empty?
        row += word
      end
    end
    wrapped << row unless row.empty?
    wrapped
  end
end
