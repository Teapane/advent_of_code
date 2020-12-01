def calculate_fuel_cost(file)
  opened_file = open_file(file)
  opened_file.each.with_object([]) do |line, arr|
    arr << (line / 3) - 2
  end.inject(:+)
end

def calculate_fuel_cost_part_two(file)
  opened_file = open_file(file)
  fuel = 0
  opened_file.each do |cost|
    while fuel > 0
      cost = (line / 3) - 2
      fuel += cost
    end
  end
  fuel
end

def open_file(file)
  File.open(file, 'r').map(&:to_i)
end

puts calculate_fuel_cost('2019/day_one_input.txt')
puts calculate_fuel_cost_part_two('2019/day_one_input.txt')
