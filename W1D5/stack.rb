class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end

if $PROGRAM_NAME == __FILE__
  stack = Stack.new
  stack.add(1)
  stack.add(2)
  p stack.remove
  stack.add(3)
  p stack.show
end
