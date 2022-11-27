# frozen_string_literal: true

require "test_helper"

class TestGameBoard < Minitest::Test
  def setup
    @board = ToyRobot::GameBoard.new 5, 5
  end

  def test_that_it_has_rows_and_columns
    assert_equal 5, @board.rows
    assert_equal 5, @board.columns
  end

  def test_place
    @board.place 2, 2
    assert_equal 2, @board.position.x
    assert_equal 2, @board.position.y
  end

  def test_valid
    assert @board.valid? 0, 0
    assert @board.valid? 4, 4
    assert @board.valid? 2, 2
    refute @board.valid? 5, 5
    refute @board.valid? 3, 10
    refute @board.valid? -1, 0
  end

  def test_invalid_place_does_not_change_position
    @board.place 2, 3
    @board.place 12, 2
    assert_equal 2, @board.position.x
    assert_equal 3, @board.position.y
  end

  def test_facing
    assert_equal :north, @board.facing

    @board.face :south
    assert_equal :south, @board.facing

    @board.face :east
    assert_equal :east, @board.facing

    @board.face :west
    assert_equal :west, @board.facing

    assert_raises ToyRobot::GameBoard::InvalidFacing do
      @board.face :invalid
    end
  end
end
