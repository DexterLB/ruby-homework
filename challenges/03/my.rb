class String
    def word_wrap(chars_per_row)
        row = ''
        split.each_with_object([]) do |word, wrapped|
            if (row + word).length + 1 > chars_per_row
                wrapped << row unless row.empty?
                row = word
            else
                row += ' ' unless row.empty?
                row += word
            end
        end + (row.empty? ? [] : [row])
    end
end
