def search(list, x)
  first = 0
  last = list.length-1
  while first <= last
    mid = (first + last)/2
    if list[mid] < x
      first = mid + 1
    elsif list[mid] > x
      last = mid -1
    else
      return mid
    end
  end
  return nil
end
