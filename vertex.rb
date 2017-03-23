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

  # An end-point for an edge, with weight of edge
  class EndPoint
    attr_accessor :row, :col, :weight

    def initialize(row, col, weight)
      @row = row

      @col = col

      @weight = weight
    end

    def to_a
      ary = []
      ary << self.row << self.col
    end
  end
end
