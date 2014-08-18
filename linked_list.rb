class LinkedList
  attr_reader :first, :last

  def prepend(new_value)
    new_node = Node.new(new_value)

    if @first.nil?
      @first = @last = new_node
    else
      new_node.next = @first
      @first = new_node
    end

    return true
  end

  def append(new_value)
    new_node = Node.new(new_value)

    if @first.nil?
      @first = @last = new_node
    else
      @last.next = new_node
      @last = new_node
    end

    return true
  end

  def insert_after(value, new_value)
    node = find_node!(value)
    new_node = Node.new(new_value)
    new_node.next = node.next
    node.next = new_node
    return true
  end

  def remove(value)
    node = find_node!(value)
    current_node = @first

    until current_node == node
      previous_node = current_node
      current_node = current_node.next
    end

    previous_node.next = current_node.next
    return true
  end

  def length
    current_node = @first
    count = 0

    until current_node.nil?
      count += 1
      current_node = current_node.next
    end

    return count
  end

  def include?(value)
    !find_node(value).nil?
  end

  def to_s
    string = ''
    current_node = @first

    until current_node.nil?
      string += current_node.value.to_s + "\n"
      current_node = current_node.next
    end

    return string
  end

  private

  def find_node(value)
    current_node = @first

    until current_node.nil?
      return current_node if current_node.value == value
      current_node = current_node.next
    end

    return nil
  end

  def find_node!(value)
    node = find_node(value)
    raise ValueNotFoundError if node.nil?
    node
  end

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
    end
  end

  class ValueNotFoundError < StandardError; end
end
