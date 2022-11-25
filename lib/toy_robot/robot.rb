module ToyRobot
  class Robot
    class InvalidDirection < ToyRobot::Error; end
    class InvalidCoordinate < ToyRobot::Error; end

    attr_reader :rows, :columns

    FACES = {north: 0, east: 1, south: 2, west: 3}
    TURN_DIRECTIONS = [:left, :right]

    def initialize rows=5, columns=5
      @game_board = GameBoard.new rows, columns
    end

    def place x, y, direction
      raise InvalidDirection unless valid_direction? direction
      raise InvalidCoordinate unless valid_coordinate? x, y
      @game_board.place x, y
      @game_board.face direction
    end

    def move
      current_x, current_y = @game_board.position.x, @game_board.position.y
      case facing
      when :north
        @game_board.place current_x, current_y + 1
      when :east
        @game_board.place current_x + 1, current_y
      when :south
        @game_board.place current_x, current_y - 1
      when :west
        @game_board.place current_x - 1, current_y
      end
      new_x, new_y = @game_board.position.x, @game_board.position.y
      if current_x == new_x && current_y == new_y
        return nil
      else
        return @game_board.position
      end
    end

    def turn direction
      raise InvalidDirection unless valid_turn_direction? direction
      case direction
      when :left
        @game_board.face FACES.key((FACES[@game_board.facing] - 1) % FACES.size)
      when :right
        @game_board.face FACES.key((FACES[@game_board.facing] + 1) % FACES.size)
      else

      end
    end

    def facing
      @game_board.facing
    end

    def position
      @game_board.position
    end

    def valid_move?
    end

    def valid_turn_direction? direction
      TURN_DIRECTIONS.include? direction
    end

    def valid_direction? direction
      FACES.keys.include? direction.downcase.to_sym
    end

    def valid_coordinate? x, y
      @game_board.valid? x, y
    end

    def next_position
    end
  end
end