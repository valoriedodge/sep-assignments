def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_index = arr.length-1
  pivot_value = arr[pivot_index]
  left_arr = []
  right_arr = []
  (0..arr.length - 2).each do |index|
    arr[index] > pivot_value ? right_arr.push(arr[index]) : left_arr.push(arr[index])
  end
  left = quick_sort(left_arr)
  right = quick_sort(right_arr)
  left + [pivot_value] + right
end

p quick_sort([4,7,12,89, 120,14,3,45,9, 48,6,19, 36, 18, 8])
