# byr (Birth Year)
# iyr (Issue Year)
# eyr (Expiration Year)
# hgt (Height)
# hcl (Hair Color)
# ecl (Eye Color)
# pid (Passport ID)
# cid (Country ID) #can be nil
require 'pry'

ATTRS = %w(
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
)

def passport_validator(input)
  parsed = parse_file(input)
  valid = []
  invalid = []
  parsed.each do |x|
    portions = sanitize_input(x)
    arr = []
    portions.map do |data|
      key, _ = data.split(":")
      arr << key
    end
    if ATTRS.all? { |z| arr.include?(z) }
      valid << x
    else
      invalid << x
    end
  end
  valid.size
end

def sanitize_input(string)
  parsed = string.sub(/\n/, " ")
  parsed.split(" ")
end

def parse_file(file)
  File.read(File.open(file, 'r')).split(/\n\n/)
end

puts passport_validator('2020/day_four_input.txt')
