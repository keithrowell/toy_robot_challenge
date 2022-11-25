module ToyRobot
  class CommandControl
    COMMANDS_REGEXES = {
      place: /^PLACE\s+(\d+),\s*(\d+),\s*(\w+)$/i,
      move: /^MOVE$/i,
      left: /^LEFT$/i,
      right: /^RIGHT$/i,
      report: /^REPORT$/i
    }

    def initialize
      @robot = Robot.new
      @commands = Commands.new
    end

    def run
      loop do
        instruction = get_user_instruction
        command_name, *args = parse_instruction instruction
        if command_name
          output = execute_command command_name, args
          puts output if output
        else
        end
      end
    end

    def get_user_instruction
      instruction = gets
    end

    def parse_instruction instruction
      COMMANDS_REGEXES.each do |command_name, regex|
        match = instruction.match regex
        return command_name, *match.captures if match
      end
      return nil
    end

    def command_valid? command
      COMMANDS_REGEXES.keys.include? command
    end

    def execute_command command_name, args
      @commands.send command_name.to_sym, *args
    end
  end
end