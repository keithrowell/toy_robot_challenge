module ToyRobot
  class Commands
    def initialize
      @robot = Robot.new
      @initial_placement_done = false
    end

    def place x, y, direction
      # ignore invalid placement, also invlaid placements do not count for initial placement
      if @robot.valid_direction?(direction) && @robot.valid_coordinate?(x, y)
        @robot.place x, y, direction
        # track that the robot has been placed on the board before allowing other commands
        @initial_placement_done = true
      end
    end

    def move
      return unless move_allowed?
      @robot.move
    end

    def left
      return unless move_allowed?
      @robot.turn :left
    end

    def right
      return unless move_allowed?
      @robot.turn :right
    end

    def report
      return unless move_allowed?
      "#{@robot.position.x}, #{@robot.position.y}, #{@robot.facing.upcase}"
    end

    def move_allowed?
      @initial_placement_done
    end
  end
end