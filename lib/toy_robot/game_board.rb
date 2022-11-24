module ToyRobot
  class GameBoard

    attr_reader :rows, :columns
    attr_reader :position

    Position = Struct.new :x, :y

    def initialize rows, columns
      @rows = rows
      @columns = columns
      @position = Position.new 0, 0
    end

    def place x, y
      if valid? x, y
        @position.x = x
        @position.y = y
      end
    end

    def valid? x, y
      validate x, y
    end

    def validate x, y
      x >= 0 && x < @columns && y >= 0 && y < @rows
    end
  end
end