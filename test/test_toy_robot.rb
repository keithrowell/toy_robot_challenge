# frozen_string_literal: true

require "test_helper"

class TestToyRobot < Minitest::Test
  def setup
    @robot = ToyRobot::Robot.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::ToyRobot::VERSION
  end

  def test_initially_facing_north
    assert_equal :north, @robot.facing
  end

  def test_turn_left
    @robot.turn :left
    assert_equal :west, @robot.facing
    @robot.turn :left
    assert_equal :south, @robot.facing
    @robot.turn :left
    assert_equal :east, @robot.facing
    @robot.turn :left
    assert_equal :north, @robot.facing
  end

  def test_turn_right
    @robot.turn :right
    assert_equal :east, @robot.facing
    @robot.turn :right
    assert_equal :south, @robot.facing
    @robot.turn :right
    assert_equal :west, @robot.facing
    @robot.turn :right
    assert_equal :north, @robot.facing
  end

  def test_turn_left_and_right
    @robot.turn :right
    assert_equal :east, @robot.facing
    @robot.turn :left
    assert_equal :north, @robot.facing
    @robot.turn :left
    assert_equal :west, @robot.facing
    @robot.turn :right
    assert_equal :north, @robot.facing
  end

  def test_invalid_turn_direction
    assert_raises ToyRobot::Robot::InvalidDirection do
      @robot.turn :invalid
    end
  end

  def test_placement
    @robot.place 2, 3, :south
    assert_equal 2, @robot.position.x
    assert_equal 3, @robot.position.y
    assert_equal :south, @robot.facing

    @robot.place 1, 4, :west
    assert_equal 1, @robot.position.x
    assert_equal 4, @robot.position.y
    assert_equal :west, @robot.facing
  end

  def test_invalid_placement
    assert_raises ToyRobot::Robot::InvalidCoordinate do
      @robot.place 5, 5, :north
    end
    assert_raises ToyRobot::Robot::InvalidDirection do
      @robot.place 2, 1, :invalid
    end
  end

  def test_move_test_case_a
    # PLACE 0, 0, NORTH
    @robot.place 0, 0, :north
    # MOVE
    @robot.move
    # REPORT
    # Output: 0, 1, NORTH
    assert_equal 0, @robot.position.x
    assert_equal 1, @robot.position.y
    assert_equal :north, @robot.facing
  end

  def test_move_test_case_b
    # PLACE 0, 0, NORTH
    @robot.place 0, 0, :north
    # LEFT
    @robot.turn :left
    # REPORT
    # Output: 0, 0, WEST
    assert_equal 0, @robot.position.x
    assert_equal 0, @robot.position.y
    assert_equal :west, @robot.facing

    # PLACE 1, 2, EAST
    @robot.place 1, 2, :east
    # MOVE
    @robot.move
    # MOVE
    @robot.move
    # LEFT
    @robot.turn :left
    # MOVE
    @robot.move
    # REPORT
    # Output: 3, 3, NORTH
    assert_equal 3, @robot.position.x
    assert_equal 3, @robot.position.y
    assert_equal :north, @robot.facing
  end

end
