# Problem Statement
# Given a custom class MyArray, 
# write a 'sum' method that takes a block parameter.

class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    if block_given?
    	@array.inject(initial_value) { |sum, number| sum += yield(number) }
    else
      @array.inject(initial_value) { |sum, number| sum += number }
    end
  end
end

# specs:
# my_array = MyArray.new([1, 2, 3]) 
# p my_array.sum == 6
# p my_array.sum(10) == 16
# p my_array.sum(0) {|n| n ** 2 } == 14