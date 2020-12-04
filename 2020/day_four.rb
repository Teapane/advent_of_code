# byr (Birth Year)
# iyr (Issue Year)
# eyr (Expiration Year)
# hgt (Height)
# hcl (Hair Color)
# ecl (Eye Color)
# pid (Passport ID)
# cid (Country ID) #can be nil
require 'pry'

ATTRS = [
  :byr,
  :iyr,
  :eyr,
  :hgt,
  :hcl,
  :ecl,
  :pid
]

def passport_validator(input)
  parsed = parse_file(input)
  parsed.each do |x|
    unless x == ["\n"]
      validate(x)
    end
  end
end

def validate(arr)
  new_arr = []
  rejected = []
  arr.each do |y|
    binding.pry
    if y.include(ATTRS)
      new_arr << y
    else
      rejected << y
    end
  end
end

def parse_file(file)
  File.open(file, 'r').each_line.map{ |x| x.split(/\n\n/) }
end

puts passport_validator('2020/day_four_input.txt')
