module ToyRobot
  class Robot
    class InvalidDirection < ToyRobot::Error; end

    attr_reader :rows, :columns

    FACES = {north: 0, east: 1, south: 2, west: 3}
    TURN_DIRECTIONS = [:left, :right]

    def initialize rows=5, columns=5
      @game_board = GameBoard.new rows, columns
    end

    def move
    end

    def turn direction
      case direction
      when :left
        @game_board.face FACES.key((FACES[@game_board.facing] - 1) % FACES.size)
      when :right
        @game_board.face FACES.key((FACES[@game_board.facing] + 1) % FACES.size)
      else
        raise InvalidDirection
      end
    end

    def report
    end

    def facing
      @game_board.facing
    end

    def valid_move?
    end

    def next_position
    end
  end
end