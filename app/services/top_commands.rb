class TopCommands
  def top(num)
    sorted_commands[0..num]
  end

  def self.top(num)
    new.top(num - 1)
  end

  private

  def commands
    all_commands = User.pluck(:commands)
    all_commands.inject({}) do |hash, command|
      command.deep_merge(hash) {|_k, old, new| old + new}
    end
  end

  def sorted_commands
    commands_array.sort_by { |pair| -pair.values.first }
  end

  def commands_hash
    commands.each_with_object({}) do |(first_cmd, sub_commands), total|
      sub_commands.each do |second_cmd, amt|
        command = [first_cmd, second_cmd].join(" ").strip
        total[command] = amt
      end
    end
  end

  def commands_array
    commands_hash.inject([]) do |memo, (k,v)|
      memo << {k => v}
    end
  end
end
