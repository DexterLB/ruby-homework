RENDER = { nil => ' ', :x => 'x', :o => 'o' }

def render_row(row)
    '| ' + row.map { |mark| RENDER[mark] }.join(' | ') + ' |'
end

def render_tic_tac_toe_board_to_ascii(board)
    board.each_slice(3).to_a.map { |row| render_row(row) }.join("\n")        
end
