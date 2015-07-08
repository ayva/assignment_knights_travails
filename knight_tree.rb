Square = Struct.new(:x, :y, :depth, :children)

class KnightTree

  def initialize(x, y)

    @root_square = Square.new(x, y, 0, [])

  end

end

class MoveTree
  attr_accessor :root
  def initialize(x, y, max_depth = 3)

    @x = y
    @y = y
    @max_depth = max_depth
    @board_size = 5
    @move_combinations = [[-2, -1],
                          [-1, -2],
                          [1, -2],
                          [2,-1],
                          [2, 1],
                          [1, 2],
                          [-1, 2],
                          [-2, 1]]
    @root = Square.new(@x, @y, 0, [])
    
     build_children(@root,1)
     #build_tree(@root,1)
      
    #count_children(@root)
  end

  def build_tree(square, d=1)

    
    arr_parents=square.children

    arr_parents.each do |child| 
        build_children(child, d)
        d+=1
        build_tree(child,d) unless d > @max_depth
    end
    print_arr(arr_parents)
  end

  
  def print_arr(arr)
    arr.each do |kid|
      puts "[#{kid.x},#{kid.y}]"
    end
  end


  def build_children(parent,depth)
    @move_combinations.each do |move|

          new_x =parent.x + move[0]
          new_y = parent.y + move[1]
          if new_x <= @board_size &&
            new_y <= @board_size &&
            new_x > 0 &&
            new_y > 0
            parent.children << Square.new(new_x, new_y, depth, [])
            puts "[#{new_x}, #{new_y}]"
          end

        end
        puts " Depth #{depth}---------------------"
  end

  def print_tree (square,d=0)
    arr_parents=square.children

    arr_parents.each do |child| 
        puts "[#{child.x},#{child.y}]"
        d+=1
        print_tree(child,d) unless d > @max_depth
    end
    
    puts memo

  end

  def count_children(square,d=0,memo=0)
    arr_parents=square.children

    arr_parents.each do |child| 
        memo+=child.children.length
        d+=1
        count_children(child,d,memo) unless d > @max_depth
    end
    
    puts memo
    

  end


end

MoveTree.new(3,3,3)






