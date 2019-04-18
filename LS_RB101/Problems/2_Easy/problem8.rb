# num_arr = (1..3).to_a.map(&:to_s)

# new_num_arr = num_arr.map.with_index { |val, idx| idx.even? ? val = "1" : val = "0" }.join



#p new_num_arr

def stringy(num, condition = 1 )
  num_arr = (1..num).to_a.map(&:to_s)
 
  # if condition == 1
  #   new_num_arr = num_arr.map.with_index { |val, idx| idx.even? ? val = "1" : val = "0" }.join
  # else 
  #   new_num_arr = num_arr.map.with_index { |val, idx| idx.even? ? val = "0" : val = "1" }.join
  # end


  new_num_arr = num_arr.map.with_index do |val, idx| 
    if condition == 1
      idx.even? ? val = "1" : val = "0"
    else
      idx.even? ? val = "0" : val = "1"
    end
  end.join
  
  p new_num_arr
end

p stringy(3, 0) == '010'