def fix_passwords(file)
  file = generate_file(file)
  keep_count = []
  discard = []
  file.each do |line|
    min, max = line.split('-').map(&:to_i)
    policy_params, password = line.split(':').map(&:strip)
    policy_chars = policy_params.split(' ').last
    count = password.chars.count { |char| char == policy_chars }
    keep = (min..max).cover?(count)
    if keep == true
      keep_count << password
    else
      discard << password
    end
  end
  keep_count
end

def one_good_password(file)
  input = generate_file(file)
  arr = []
  input.each do |line|
    parts = line.split(" ")
    counts = parts[0]
    letter = parts[1].gsub(':', '')
    password = parts[2]
    counts.split('-').each do |x, y|
      if password[x.to_i - 1] == letter && password[y.to_i]
        arr << password
      end
    end
  end
  arr.size
end

def generate_file(file)
  File.open(file, 'r')
end

puts fix_passwords('2020/day_two_input.txt')
puts fix_passwords('2020/day_two_input.txt')
puts one_good_password('2020/day_two_input.txt')
