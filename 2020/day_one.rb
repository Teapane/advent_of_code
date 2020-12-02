# Day One:
# Part One
def expense_report(file, permutation, target)
  opened_file = open_file(file)
  opened_file.permutation(permutation).find do |collection|
    collection.sum == target
  end.inject(:*)
end

def open_file(file)
  File.open(file, 'r').map(&:to_i)
end

puts expense_report('2020/day_one_input.txt', 2, 2020) # => 964875
puts expense_report('2020/day_one_input.txt', 2, 2020) # => 964875
puts expense_report_each_cons('2020/day_one_input.txt', 3, 2020) # => 158661360
