require 'pry'

def fix_passwords(file)
  hash = generate_hash_map(file)
  keep_count = []
  hash.each do |password_rules,password|
    min, max = password_rules.split('-').map(&:to_i)
    policy = password_rules.split(' ').last

    count = password.chars.count { |char| char == policy }
    keep = (min..max).cover?(count)
    puts keep if keep == true
    if keep == true
      keep_count << password
    end
  end
  keep_count.size
end

def generate_hash_map(file)
  File.open(file, 'r').each_line.with_object({}) do |line, hash|
    arr = line.split(":").map(&:strip)
    hash[arr[0]] = arr[1]
    hash
  end
end

puts fix_passwords('2020/day_two_input.txt')
puts fix_passwords('2020/day_two_input.txt')
