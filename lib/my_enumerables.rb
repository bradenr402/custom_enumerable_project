module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield element
    end
    return self
  end

  def my_each_with_index
    i = 0
    for element in self
      yield element, i
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |element| result << element if yield element }
    result
  end

  def my_all?
    my_each { |element| return false unless yield element }
    true
  end

  def my_any?
    my_each { |element| return true if yield element }
    false
  end

  def my_none?
    my_each { |element| return false if yield element }
    true
  end

  def my_count
    return length unless block_given?
    count = 0
    my_each do |element|
      count += 1 if yield element
    end
    count
  end

  def my_map block = nil
    result = []
    my_each { |element| result << (block ? block.call(element) : yield(element) ) }
    result
  end

  def my_inject(initial = nil)
    result = initial
    my_each { |element| result = yield(result, element) }
    result
  end
end
