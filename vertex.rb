# vertex.rb
#
# 20170320	GH
#
module Vertex
  class Vertex
    attr_accessor :x_pos, :y_pos, :end_points

    def initialize(x_pos, y_pos)
      @x_pos = x_pos

      @y_pos = y_pos

      @end_points = []
    end
  end

  class EndPoint
    attr_accessor :x_pos, :y_pos, :weight

    def initialize(x_pos, y_pos, weight)
      @x_pos = x_pos

      @y_pos = y_pos

      @weight = weight
    end
  end
end
