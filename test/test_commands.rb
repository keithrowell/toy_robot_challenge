# frozen_string_literal: true

require "test_helper"

class TestCommands < Minitest::Test
  def setup
    @commands = ToyRobot::Commands.new
  end

  def test_commands_without_place_are_ignored
    @commands.move
    assert_nil @commands.report
    @commands.left
    assert_nil @commands.report
    @commands.right
    assert_nil @commands.report
    @commands.report
    assert_nil @commands.report
  end

  def test_place
    @commands.place 2, 3, :north
    assert_equal "2, 3, NORTH", @commands.report
  end

  def test_place_with_strings
    @commands.place '2', '3', 'NORTH'
    assert_equal "2, 3, NORTH", @commands.report
  end

  def test_move
    @commands.place 2, 3, :north
    @commands.move
    assert_equal "2, 4, NORTH", @commands.report
  end

  def test_left
    @commands.place 2, 3, :north
    @commands.left
    assert_equal "2, 3, WEST", @commands.report
  end

  def test_right
    @commands.place 2, 3, :north
    @commands.right
    assert_equal "2, 3, EAST", @commands.report
  end
end
