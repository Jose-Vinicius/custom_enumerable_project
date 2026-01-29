module Enumerable
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    index = 0

    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    new_arr = []
    for item in self
      new_arr << item if yield(item) == true
    end
    new_arr
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    new_arr = []
    for item in self
      new_arr << true if yield(item) == true
    end
    new_arr.length == self.length ? true : false
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    new_arr = []
    for item in self
      new_arr << yield(item)
    end
    new_arr.include?(true) ? true : false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    new_arr = []
    for item in self
      new_arr << false if yield(item) == false
    end
    new_arr.length == self.length ? true : false
  end

  def my_count
    unless block_given?
      return self.length
    end
    new_array = []
    for item in self
      new_array << true if yield(item)
    end
    new_array.length
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  def my_inject(initial_agg=0)
    return to_enum(:my_inject) unless block_given?
    agg = initial_agg
    for number in self
      agg = yield(agg, number)
    end
    agg
  end
end



class Array
   def my_each
    return to_enum(:my_each) unless block_given?
     for item in self
       yield(item)
     end
   end
end

arr = [1,2,3]
p arr.my_inject(10) {|agg, number| agg + number}
p arr.my_map {|n| n * 2}
p arr.my_count {|n| n > 5}
p arr.my_none? {|n| n > 2}
p arr.my_any? {|n| n > 2}
p arr.my_all? {|n| n > 0}
p arr.my_select {|n| n.even?}
arr.my_each { |item| puts "#{item}"}
arr.my_each_with_index { |item, inx| puts "Item: #{item} | #{inx}" }