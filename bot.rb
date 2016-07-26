require "json"

$stdin.sync = true
$stdout.sync = true
@blah = "{
  \"board\": [[2,0,2,1,2,1],
            [2,1,2,1,2,1],
            [1,2,1,2,1,2],
            [2,2,1,2,1,1],
            [1,2,2,1,2,1],
            [2,1,2,1,2,2],
            [1,2,2,1,2,1]],
  \"id\": 1,
  \"players\": [
    {\"name\": \"docker.insops.net/playerOne/bot:latest\"},
    {\"name\": \"docker.insops.net/playerTwo/bot:latest\"}
  ],
  \"winner\": null,
  \"winReason\": null,
  \"currentPlayer\": 1
}"
def main
  loop do
    game_state = JSON.parse(gets)
    row_height = game_state["board"].length
    column_width = game_state["board"][0].length
    if game_state["winner"]
      break
    end
    loop do
      play = rand(column_width)
      if game_state["board"][0][play] == 0
        self.three_in_row(game_state["board"], play)
        break
      end
    end
  end
end

def self.three_in_row (board, play)
  prev = 0
  count = 0
  board = board.reverse
  for i in 0 ... board[0].length do
    board.each_with_index { |row, index|
      if row[i] == 0 and prev == 0
        count = 0
        next
      elsif row[i] == prev
        count += 1 
      else
        count = 1
        prev = row[i]
      end
      if count == 3
        if board[index+1][i] != 0
          count = 1
          prev = row[i]
          next
        else
          puts i
          return
        end
      end
    }
  end
  if !self.three_in_row_row(board, play)
    puts play
  end
end
def self.three_in_row_row(board, play)
  prev = 0
  count = 0
  board.each_with_index {|row, row_index|
    row.each_with_index {|col, column_index|
      if col == 0 and prev == 0
        count = 0
        next
      elsif col == prev
        count += 1 
      else
        count = 1
        prev = col 
      end
      if count == 3
        if row[column_index+1] != 0 || board[row_index+1][column_index+1] != 0
          count = 1
          prev = col
          next
        else
          puts column_index+1
          return true
        end
      end
    }
    count = 0
    prev = 0
  }
  return false
end
main
