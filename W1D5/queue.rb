class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

if $PROGRAM_NAME == __FILE__
  queue = Queue.new
  queue.enqueue(1)
  queue.enqueue(2)
  p queue.dequeue
  queue.enqueue(3)
  p queue.show
end
