require 'byebug'
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[@store.length-1] = @store[@store.length-1], @store[0]
    res = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, @store.length)
    res
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length-1, @store.length)
  end

  public
  def self.child_indices(len, parent_index)
    res = []
    (1..2).each do |add|  
      idx = (parent_index*2)+add
      if idx<len 
        res << idx
      end 
    end 
    res
  end

  def self.parent_index(child_index)
    if child_index==0 
      raise 'root has no parent'
    end 
    (child_index-1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new{ |x,y| x <=> y}
    # byebug
    
    child_indices(len, parent_idx).each do |idx| 
      res = prc.call(array[idx], array[parent_idx])
      if res==-1
        
        if(child_indices(len, parent_idx)[1])
          
          if (prc.call(array[idx], array[idx+1]) == -1)
            array[parent_idx], array[idx] = array[idx], array[parent_idx]
            return heapify_down(array, idx, len, &prc)
          else 
            array[parent_idx], array[idx+1] = array[idx+1], array[parent_idx]
            return heapify_down(array, idx+1, len, &prc)
          end 
        else 
          array[parent_idx], array[idx] = array[idx], array[parent_idx]
          return heapify_down(array, idx, len, &prc)
        end 
               
      end 
    end 
    array
  end

  # def self.heapify_down(array, parent_idx, len = array.length, &prc)
  #   prc ||= Proc.new{ |x,y| x <=> y}
  #   #FIrst I want to get left and right child indices
  #   #Base case: If neither of them are greater than the parent, then I just return the array 
  #   #THen I pick the smallest child

  #   left, right = child_indices(len, parent_idx)[0], child_indices(len, parent_idx)[1]

  #   if prc.call(array[left], array[parent_idx])==-1 || prc.call(array[right], array[parent_idx])==-1
  #     if array[right]
  #       if (prc.call(array[left], array[right]) == -1)
  #         array[parent_idx], array[left] = array[left], array[parent_idx]
  #         return heapify_down(array, left, len, &prc)
  #       else 
  #         array[parent_idx], array[right] = array[right], array[parent_idx]
  #         return heapify_down(array, right, len, &prc)
  #       end 
  #     else 
  #       array[parent_idx], array[left] = array[left], array[parent_idx]
  #       return heapify_down(array, left, len, &prc)
  #     end 
  #   end 
  #   array 

  # end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    if (child_idx==0 )
      return array
    end 

    prc ||= Proc.new{ |x,y| x <=> y}
    
    res = prc.call(array[child_idx], array[parent_index(child_idx)])
    if res==-1 
      array[child_idx], array[parent_index(child_idx)] = array[parent_index(child_idx)], array[child_idx]
      return heapify_up(array, parent_index(child_idx), len, &prc)
    end 
    
    array

  end
end
