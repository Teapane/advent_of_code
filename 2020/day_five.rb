require 'pry'
def find_seat(file)
  parsed_file = parse_file(file)
  parsed_file.each do |line|
    binding.pry
  end

end

def parse_file(file)
  File.open(file, 'r').map(&:strip)
end

puts find_seat('2020/day_five_input.txt')
