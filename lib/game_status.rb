# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8],
    [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]
  ]

def won?(board)
  for win_combination in WIN_COMBINATIONS do
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return win_combination
      end
      if (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
  end
  return false
end

def full?(board)
  board.each do |element|
    if (element == " ")
      return false
    end
  end
  return true
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if (over?(board) && !draw(board))
    winner = nil
    win_combination = won?(board)
    if (board[win_combination[0]] == "X" || board[win_combination[1]] == "X" || board[win_combination[2]] == "X")
      winner = "X"
    elsif (board[win_combination[0]] == "O" || board[win_combination[1]] == "O" || board[win_combination[2]] == "O")
      winner = "O"
    else
       nil
    end
  end
  return winner
end
