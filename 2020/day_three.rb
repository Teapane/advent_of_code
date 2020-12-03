require 'pry'
def tree_finder(maze)
  tree_maze = file_open(maze)
  # set starting coordinates and init a counter for trees encountered
  starting_x = 0
  starting_y = 0
  trees_encountered = 0

  # define the slope we are taking 3/1
  run = 3
  rise = 1

  # non zero index
  while starting_y < tree_maze.length - 1
    starting_x += run
    starting_x %= tree_maze[0].length
    starting_y += rise

    trees_encountered += 1 if tree_maze[starting_y][starting_x] == '#'
  end
  trees_encountered
end

# Right 1, down 1.
# Right 3, down 1. (This is the slope you already checked.)
# Right 5, down 1.
# Right 7, down 1.
# Right 1, down 2.

def tree_finder_part_two(maze)
  tree_maze = file_open(maze)

  # array of slopes we can iterate over
  # since we already did 3,1 we can just add that to starting array, 240, to skip that computation again. \0/
  slopes = [[1,1],[5,1],[7,1],[1,2]]

  # 240 was the result from the first run, we will add each subsequent tree encountered to this array so we can multiply at the end
  arr = [240]

  slopes.map do |x,y|
    trees_encountered = 0
    starting_x = 0
    starting_y = 0

    # non zero index
    while starting_y < tree_maze.length - 1
      starting_x += x
      starting_x %= tree_maze[0].length
      starting_y += y

      trees_encountered += 1 if tree_maze[starting_y][starting_x] == '#'
    end
    arr << trees_encountered
  end
  arr.inject(:*)
end

# creates 2d matrix, strips new lines and makes each entry a string
# [".", ".", "#", ".", "#"] => for example
def file_open(file)
  File.open(file, 'r').each_line.map(&:strip).map { |x| x.split('') }
end

puts tree_finder('2020/day_three_input.txt')
puts tree_finder_part_two('2020/day_three_input.txt')
