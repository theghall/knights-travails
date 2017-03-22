# vertex.rb
#
# 20170320	GH
#
module Vertex
  class Vertex
    attr_accessor :row, :col, :end_points

    def initialize(row, col)
      @row = row

      @col = col

      @end_points = []
    end

    def ==(pos)
      row == pos[0] && col == pos[1]
    end

  end

  class EndPoint
    attr_accessor :row, :col, :weight

    def initialize(row, col, weight)
      @row = row

      @col = col

      @weight = weight
    end
  end
end
