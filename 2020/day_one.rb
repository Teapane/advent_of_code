# Day One:
# Part One
def two_sum(file, target)
  opened_file = open_file(file)
  opened_file.permutation(2).find do |collection|
    collection.sum == target
  end.inject(:*)
end

# Part two
def three_sum(file, target)
  opened_file = open_file(file)
  opened_file.permutation(3).find do |collection|
    collection.sum == target
  end.inject(:*)
end


def open_file(file)
  File.open(file, 'r').map(&:to_i)
end

puts two_sum('2020/day_one_input.txt', 2020) # => 964875
puts three_sum('2020/day_one_input.txt', 2020) # => 158661360
