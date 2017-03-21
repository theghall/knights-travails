# knights_travails.rb
#
# 20170320	GH
#
require './vertex'
require 'byebug'

def valid_pos(x, y)
  x >= 0 && x <= 7 && y >= 0 && y <= 7
end

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
        vertex.end_points << Vertex::EndPoint.new(new_x, new_y, 1) if valid_pos(new_x,new_y)
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

def knight_move(start_pos, end_pos, board)
  root = board[start_pos[0]][start_pos[1]]

  queue = [].push(root)

  until queue.empty?
    vertex = queue.shift

    found = vertex == start_pos

    break if found

    byebug
    vertices = vertex.end_points

    vertices.each do |pos| 
      queue.push(board[pos[0]][pos[1]])
    end

  end
  found
end

board = build_board_map

p knight_move([0, 0], [1, 2], board)
p knight_move([0, 0], [0, 4], board)
p knight_move([0, 0], [7, 7], board)

