class UndefinedVariableError < StandardError; end

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
    "Implement Expression#evaluate in #{__FILE__}"
  end
end
