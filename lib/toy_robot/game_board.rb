module ToyRobot
  class GameBoard
    class InvalidFacing < ToyRobot::Error; end

    attr_reader :rows, :columns
    attr_reader :position
    attr_reader :facing

    Position = Struct.new :x, :y
    FACES = [:north, :east, :south, :west]

    def initialize rows, columns
      @rows = rows
      @columns = columns
      @position = Position.new 0, 0
      @facing = :north
    end

    def place x, y
      if valid? x, y
        @position.x = x
        @position.y = y
      end
    end

    def face direction
      if FACES.include? direction
        @facing = direction
      else
        raise InvalidFacing
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