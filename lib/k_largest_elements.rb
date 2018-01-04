require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new
  array.each do |el| 
    heap.push(el)
  end 
  new_arr = []
  (0...heap.count).each do |idx| 
    new_arr << heap.extract
  end 
  idx = new_arr.length-1
  res = []
  p k 
  p new_arr
  k.times do 
    res << new_arr[idx]
    idx -=1
  end 
  res.reverse
end
