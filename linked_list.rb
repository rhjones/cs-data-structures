# Node class with value and pointer
class Node
  attr_accessor :value
  attr_accessor :pointer
  # set accessor for pointer b/c want to be able to change

  def initialize(value)
    @value = value
  end
end

# LinkedList class
class LinkedList
  # every list has a beginning and an end
  attr_accessor :beginning
  attr_accessor :end

  # set up "empty" list where beginning is end
  def initialize(beginning)
    @beginning = beginning
    @end = beginning
  end

  # append
  # make end of list point to new node
  # set end to the new node
  def append(node)
    @end.pointer = node
    @end = @end.pointer
  end

  # prepend
  # point node to the beginning of the list
  # set the beginning to the new node
  def prepend(node)
    node.pointer = @beginning
    @beginning = node
  end

  def iterate
    current = @beginning

    until current.nil?
      yield current
      current = current.pointer
    end
  end

  # find (true/false)
  def find(value)
    iterate do |node|
      if value == node.value
        puts 'found'
        return node
      end
    end
    puts 'not found'
    false
  end

  # insert after given value
  def insert(node, value)
    existing_node = find(value)
    if existing_node
      node.pointer = existing_node.pointer
      existing_node.pointer = node
      return
    end
    puts "#{value} does not exist in list"
    false
  end

  # remove given value
  # this would be better w/doubly linked list
  # would also be better to make shorter
  def remove(value)
    current_node, previous_node = @beginning
    until current_node.nil?
      if current_node.value == value
        previous_node.pointer = current_node.pointer
        return true
      end
      previous_node = current_node
      current_node = current_node.pointer
    end
    puts "#{value} does not exist in list"
  end

  # find length
  def length
    count = 0
    iterate { count += 1 }
    count
  end

  # use to_s to return all values
  def print_list
    iterate do |node|
      puts node.value.to_s
    end
  end
end

v0 = Node.new(7)
v1 = Node.new(43)
v2 = Node.new(22)
list = LinkedList.new(v0)
list.append(v1)
list.append(v2)
