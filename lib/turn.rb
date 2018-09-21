class String
  def numeric?
    Float(self) != nil rescue false
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  if user_input.numeric?
    then
      while user_input.to_i < 1 or user_input.to_i > 9
        puts "That is not a valid input. Please choose a number between 1 and 9:"
        user_input = gets.strip
      end
      return user_input.to_i - 1
    else
      return -1
    end


end

def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  else
    if index <= 8 && index >= 0
      return true
    else
      return false
    end
  end
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil || board[index] == ""  then
    return false
  elsif board[index] == "X" || board[index] == "O" then
    return true
  end
end

def turn(board)
  puts "Welcome to Tic Tac Toe!"
  display_board(board)
  puts "Where would you like to go?"
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  while valid_move?(board, index) == false
    puts "Please enter a space that is not already occupied:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
  move(board, index, value = "X")
  display_board(board)
end
