# vertex.rb
#
# 20170320	GH
#
module Vertex
  # A node in a bi-directional tree
  class Vertex
    attr_accessor :row, :col, :visited, :end_points

    def initialize(row, col)
      @row = row

      @col = col

      @visited = false

      @end_points = []
    end

    def to_a
      ary = []
      ary << self.row << self.col
    end
  end
end
