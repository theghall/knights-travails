# knights_travails.rb
#
# 20170320	GH
#
require './vertex'
require 'byebug'

def build_edges(vertex)
  x_deltas = [[-1, 1], [-2, 2]]

  y_deltas = [[-2, 2], [-1, 1]]

  x_pos = vertex.x_pos

  y_pos = vertex.y_pos

  (0..1).each do |row|
    (0..1).each do |x|
      (0..1).each do |y|
        new_x = x_pos + x_deltas[row][x]
        new_y = y_pos + y_deltas[row][y]
        vertex.end_points << Vertex::EndPoint.new(new_x, new_y, 1) if new_x >= 0 && new_y >=0
      end
    end
  end
end

def build_board_map
  board = Array.new(8) {Array.new(8)}

  (0..7).each do |x|
    (0..7).each do |y|
      board[x][y] = Vertex::Vertex.new(x, y)
      build_edges(board[x][y])
    end
  end
  board
end

board = build_board_map
byebug
p board
