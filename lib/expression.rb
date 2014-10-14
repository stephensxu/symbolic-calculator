require "stack"

class UndefinedVariableError < StandardError; end

def factorial(n)
  result = 1

  n.downto(1) do |i|
    result *= i
  end

  result
end

SYMBOL_TABLE = {
  "+" => lambda { |stack, x, y| x + y },
  "-" => lambda { |stack, x, y| x - y },
  "!" => lambda { |stack, n| factorial(n) },
  "%" => lambda { |stack, n| x % y },
  "if" => lambda { |stack, x, y, z| x == 0 ? y : z },
  ">" => lambda { |stack, x, y| x > y ? 1 : 0 },
  "loop" => lambda do |stack, n|
    op = stack.pop
    if op == "add"
      result = 0
      n.times do
        result += stack.pop
      end

      result
    elsif op == "mul"
      result = 1
      n.times do
        result *= stack.pop
      end

      result
    end
  end
}

class Expression

  # Returns a new expression
  def initialize(expr)
    @expr = expr
  end

  # Evaluates an expression, simplifying if possible.
  #
  # @param bindings [Hash] a map of variable names to concrete values
  # @return [Expression] Returns a possibly-simplified Expression
  def evaluate(bindings = {})
    p "#{bindings}"
    "Implement Expression#evaluate in #{__FILE__}"
  end
end
