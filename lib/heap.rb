class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
  end

  def peek
  end

  def push(val)
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
    
    
    child_indices(len, parent_idx).each do |idx| 
      res = prc.call(array[parent_idx], array[idx])

      if res==1
        if(array[idx+1])
          if idx==child_indices(len, parent_idx)[1] || (prc.call(array[idx], array[idx+1]) == -1)
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

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
