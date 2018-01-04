require_relative "heap"
require 'byebug'
class Array

  #Transform array into a heap in-place
  #In the video he uses a max-heap
  #Change what heapify down thinks the len is
  #I can just use a min heap and reverse the result 

  #Insert all stuff into a heap 
  #Then extract all the elements until it's empty
  def heap_sort!
    if self == self.sort 
      return self
    end 

    (0...self.length).each do |idx| 
      el = self[idx]
      BinaryMinHeap.heapify_up(self, idx, idx+1)
    end 
  en = self.length-1
  while en>0 
    # byebug
    self[0], self[en] = self[en], self[0]
    en -= 1
   
    BinaryMinHeap.heapify_down(self, 0, en+1)
  end 
    
    self.reverse!
  end
end
