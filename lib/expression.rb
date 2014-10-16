require "stack"
require "node"

class UndefinedVariableError < StandardError; end

class Expression

  def initialize(expr)
    @expr = expr
  end

  def evaluate(bindings = {})
    puts "bindings is #{bindings.inspect}"
    stack = Stack.new

    tokens.each do |token|
      if Node.operator?(token)
        rhs = stack.pop
        lhs = stack.pop
        stack.push(Node.load(token, lhs, rhs))
      elsif bindings.key?(token)
        stack.push(Node.load(bindings[token]))
      else
        stack.push(Node.load(token))
      end
    end
    stack.pop.simplify
  end

  private

  def tokens
    @tokens ||= @expr.split(" ")
  end

  def operator?(token)
    ['+', '-', '*'].include?(token)
  end
end
