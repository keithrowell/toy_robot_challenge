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
end
