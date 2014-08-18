class Stack
  def push(new_value)
    new_node = Node.new(new_value)

    if @top.nil?
      @top = new_node
    else
      new_node.next = @top
      @top = new_node
    end

    return true
  end

  def pop
    if @top.nil?
      raise EmptyStackError
    else
      value = @top.value
      @top = @top.next
      return value
    end
  end

  def peek
    @top.nil? ? nil : @top.value
  end

  private

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
    end
  end

  class EmptyStackError < StandardError; end
end
