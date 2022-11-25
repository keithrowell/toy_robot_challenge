# frozen_string_literal: true

require "test_helper"

class TestCommandControl < Minitest::Test
  def setup
    @command_control = ToyRobot::CommandControl.new
  end

  def test_valid_command
  end

  def test_parse_instruction
    assert_equal [:place, "2", "3", "NORTH"], @command_control.parse_instruction("PLACE 2, 3, NORTH")
    assert_equal [:move], @command_control.parse_instruction("MOVE")
    assert_equal [:move], @command_control.parse_instruction("move") # lower case not ruled out
    assert_equal [:left], @command_control.parse_instruction("LEFT")
    assert_equal [:right], @command_control.parse_instruction("RIGHT")
    assert_equal [:report], @command_control.parse_instruction("REPORT")

    assert_nil @command_control.parse_instruction("PLACE 2, NORTH") # missing cordiinate
    assert_nil @command_control.parse_instruction("PLACE") # no params
    assert_nil @command_control.parse_instruction("BOGUS") # bogus command
    assert_nil @command_control.parse_instruction("MOVE 2") # invalid args
    assert_nil @command_control.parse_instruction("LEFT 1") # invalid args
    assert_nil @command_control.parse_instruction("REPORT 3") # invalid args
  end

  def test_execute_command
    command, *args = [:place, "2", "3", "NORTH"]
    @command_control.execute_command command, args
    command, *args = [:report]
    output = @command_control.execute_command command, args
    assert_equal "2, 3, NORTH", output
  end
end
