class Stack
  class UnderFlowError < StandardError; end

  def initialize
    @stack = []
  end

  def pop
    raise UnderFlowError, "Stack is empty" if empty?
    @stack.pop
  end

  def push(element)
    @stack.push(element)
  end

  def peek
    @stack.last
  end

  def empty?
    @stack.empty?
  end
end
