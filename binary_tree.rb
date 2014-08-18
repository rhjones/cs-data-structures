class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(value)
    if value < @value
      if @left.nil?
        @left = BinaryTree.new(value)
      else
        @left.insert(value)
      end
    elsif value > @value
      if @right.nil?
        @right = BinaryTree.new(value)
      else
        @right.insert(value)
      end
    else
      raise DuplicateValueError
    end
  end

  def include?(value)
    if value == @value
      return true
    elsif value < @value
      if @left.nil?
        return false
      else
        return @left.include?(value)
      end
    elsif value > @value
      if @right.nil?
        return false
      else
        return @right.include?(value)
      end
    end
  end

  def to_s
    "#{@left} #{@value} #{@right}"
  end

  private

  class DuplicateValueError < StandardError; end
end
