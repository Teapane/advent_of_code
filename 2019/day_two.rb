def calculate_fuel_cost(file)
  fuel = 0
  File.open(file, "r") do |f|
    f.each_line do |line|
      while line.to_i > 0
        line = (line.to_i / 3) - 2
        fuel += line.to_i
      end
    end
  end
  puts fuel
end

puts calculate_fuel_cost('2019/day_one_input.txt')
