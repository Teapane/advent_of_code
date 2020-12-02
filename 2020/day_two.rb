def fix_passwords(file)
  file = generate_file(file)
  keep_count = []
  discard = []
  file.each do |line|
    min, max = line.split('-').map(&:to_i)
    policy, password = line.split(':').map(&:strip)
    policy_chars = policy.split(' ').last
    count = password.chars.count { |char| char == policy_chars }
    keep = (min..max).cover?(count)
    if keep == true
      keep_count << password
    else
      discard << password
    end
  end
  puts discard.size
  puts keep_count.size
end

def generate_file(file)
  File.open(file, 'r')
end

puts fix_passwords('2020/day_two_input.txt')
puts fix_passwords('2020/day_two_input.txt')
