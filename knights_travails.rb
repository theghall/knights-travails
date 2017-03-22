# knights_travails.rb
#
# 20170320	GH
#
require './vertex'
require 'byebug'

def valid_pos(row, col)
  row >= 0 && row <= 7 && col >= 0 && col <= 7
end

def build_edges(vertex)
  x_deltas = [[-1, 1], [-2, 2]]

  y_deltas = [[-2, 2], [-1, 1]]

  row = vertex.row

  col = vertex.col

  (0..1).each do |d_row|
    (0..1).each do |x|
      (0..1).each do |y|
        new_row = row + x_deltas[d_row][x]
        new_col = col + y_deltas[d_row][y]
        vertex.end_points << Vertex::EndPoint.new(new_row, new_col, 1) if valid_pos(new_row,new_col)
      end
    end
  end
end

def build_board_map
  board = Array.new(8) {Array.new(8)}

  (0..7).each do |row|
    (0..7).each do |col|
      board[row][col] = Vertex::Vertex.new(row, col)
      build_edges(board[row][col])
    end
  end

  board
end

def knight_move(start_pos, end_pos, board)
  puts("Knight path for: #{start_pos} => #{end_pos}")

  root = board[start_pos[0]][start_pos[1]]

  queue = [].push(root)

  until queue.empty?
    vertex = queue.shift

    found = vertex == end_pos

    break if found

    vertices = vertex.end_points

    vertices.each do |vtx| 
      queue.push(board[vtx.row][vtx.col])
    end

  end

  found
end

board = build_board_map
p knight_move([0, 0], [1, 2], board)
p knight_move([0, 0], [0, 4], board)

