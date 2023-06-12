# Given a sorted array of n unique integers where each integer is in the range of 0 to m-1 and m> n.
#Find the smallest number that is missing from the array. 

#Algorithm: Binary Search (Compare elements with indexes and then decide)
#Time-complexity: O(logn), Auxiliary-space:O(1)

# Iterative

def smallest_missing(a)
    low = 0 #The starting low value
    high = a.length-1 #the length of the Array is the high value 
    #this while loop contiues for as long high is greater than low
    while high >low
        mid = low +(high - low ) / 2 #mid of the binary search
        #here we do the comparsion to see if the number in the array is greater than the mid value
        if a[mid]>mid
            high = mid
        else
            low = mid + 1
        end
    end
    if a[low] == low #if lo = end of the array
        puts low + 1
    else 
        puts low
    end
end

smallest_missing([0,1,2,3])
smallest_missing([0,1,2,5])

#recursive

def driver_func(a)
    low = 0
    high = a.length-1
    puts smallest_missing(a,low,high)
end

def smallest_missing(a,low,high)
    if low>high
        return high+1
    end
    if a[low] != low 
        return low
    end
    mid = low + (high-low)/2
    if a[mid]>mid
        return smallest_missing(a,low,mid)
    else
        return smallest_missing(a, mid+1,high)
    end
end

driver_func([0,1,2,3])
driver_func([0,1,2,3,4,6])