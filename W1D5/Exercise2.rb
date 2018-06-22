class Queue

  def initialize
    @array = []
  end

  def enqueue(el)
    @array.push(el)
  end

  def dequeue
    @array.shift
  end

  def peek
    @array.first
  end

end
