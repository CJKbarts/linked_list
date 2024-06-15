class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    @head = node if head.nil?

    if tail.nil?
      @tail = node
    else
      tail.next_node = node
      @tail = node
    end

    @size += 1
  end

  def prepend(value)
    node = Node.new(value)

    if head.nil?
      @head = node
    else
      node.next_node = head
      @head = node
    end

    @size += 1
  end

  def at(index)
    return if index >= size

    current_node = head
    (index).times { current_node = current_node.next_node }
    current_node
  end

  def pop
    last_node = tail
    @tail = at(size - 2)
    tail.next_node = nil
    @size -= 1

    last_node
  end

  def contains?(value)
    each_node { |node| return true if node.value == value }
    false
  end

  def find(value)
    index = 0
    each_node do |node|
      return index if node.value == value

      index += 1
    end
    nil
  end

  def to_s
    string = ''
    each_node do |node|
      string += "(#{node.value}) -> "
    end

    string += 'nil'
    string
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    new_node.next_node = at(index)
    if index == 0
      @head = new_node
    else
      at(index - 1).next_node = new_node
    end
    @size += 1
  end

  def remove_at(index)
    if index == 0
      @head = head.next_node
    elsif index == (size - 1)
      @tail = at(index - 1)
      tail.next_node = nil
    else
      at(index - 1).next_node = at(index + 1)
    end

    @size -= 1
  end

  private

  def each_node
    current_node = head
    size.times do
      yield(current_node)
      current_node = current_node.next_node
    end
  end
end
