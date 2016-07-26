class Brain
 def self.move(board)
   current_user = 1
   in_a_row_count = 0
   player_counting = 0
   previous_player_counting = 0
   row_height = board[0].length
   for row in board
    if row.count(0) == row_height
      puts "NOPE ALL ZEROS"
      next
    end
    for col in row 
     player_counting = col 
     in_a_row_count += 1
    end
   end 
 end
end
