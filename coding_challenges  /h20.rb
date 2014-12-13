# array = [2, 3, 1, 3, 5, 2, 2, 4, 3]

# array.map.with_index {|x,i| [x, i + 2]}
# # => [[2, 2], [3, 3], [1, 4], [3, 5], [5, 6], [2, 7], [2, 8], [4, 9], [3, 10]]

# # find first the minimum and then do something with that. keep track of the index of the minimum
# l = array.length
# (0..l-1).each do |i|
# if a[i] <= a[i-1] && a[i] <= a[i+1]

# area = 0 
# hash = {}
# array.each_with_index do |k, [item, index]|
#     if item
#     # hash[item[0]] = { item: index }
# end
# end


def area(a)
 l = a.length
 area = 0
 min_array = []
 (1..l-2).each do |i|
   if (a[i] <= a[i-1]) && (a[i] <= a[i+1])
         min_array[i] << a[i]
   end
 end
 min_array.each do |k| 
 temp = 0
 atemp = a[k]
 for p in (1..l-k-2)
   if a[k] != a[k+p] then
     break
   else temp +=1
   end 
   temp 
 end
 area += ([a[k-1]-a[k], a[k+temp+1]-a[k]].min)*(temp+1) 
 end 
 area 
end

