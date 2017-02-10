def search(list, x)
  mid = list.length / 2
  return mid if list[mid] == x
  if list[mid] < x
    new_list = list.slice(mid+1..list.length)
  elsif list[mid] > x
    new_list = list.slice(0..mid-1)
  end
  if new_list && new_list.length > 0
    search(new_list, x)
  else
    return nil
  end
end
