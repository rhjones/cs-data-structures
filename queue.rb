class Queue
  def enqueue(new_value)
    new_node = Node.new(new_value)

    if @last.nil?
      @first = @last = new_node
    else
      @last.next = new_node
      @last = new_node
    end

    return true
  end

  def dequeue
    if @first.nil?
      raise EmptyQueueError
    else
      value = @first.value
      @first = @first.next
      return value
    end
  end

  def peek
    @first.nil? ? nil : @first.value
  end

  private

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
    end
  end

  class EmptyQueueError < StandardError; end
end
