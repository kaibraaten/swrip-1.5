# Misc functions from the Python library that are missing from Imp.

# Do an operation on every object in sequence.
# The function you provide must take one argument and return a value.
def map(function, sequence):
    newlist = [None] * len(sequence)
    
    for n in range(0, len(sequence)):
        newlist[n] = function(sequence[n])
        
    return newlist

# Return new list containing all objects that makes pred return True.
def filter(pred, seq):
    def counttrue():
        counter = 0

        for n in seq:
            if pred(n):
                counter = counter + 1                

        return counter
        
    newlist = [None] * counttrue()
    idx = 0

    for n in seq:
        if pred(n):
            newlist[idx] = n
            idx = idx + 1

    return newlist

# Accumulate result of values returned by function as applied to every object
# in sequence. initial will often, but not always, be zero. See sum(), max()
# and min() below for examples of what it can be used for.
def reduce(function, seq, initial):
    accumulator = initial

    for n in seq:
        accumulator = function(accumulator, n)

    return accumulator

# Return the sum of adding all objects together.
def sum(seq):
    return reduce(lambda x, y: x + y, seq, 0)

# Return the greatest value in sequence.
# To get the same effect as max(arg1, arg2, *args) use max([arg1, arg2, etc])
def max(seq):
    return reduce(lambda x, y: x > y and x or y, seq, 0)

# Return the smallest element in sequence.
# To get the same effect as min(arg1, arg2, *args) use min([arg1, arg2, etc])
def min(seq):
    return reduce(lambda x, y: x < y and x or y, seq, 0)

# Return x raised to the power of y.
def pow(x, y):
    return y == 0 and 1 or x * pow(x, y - 1)

# Return absolute value of x.    
def abs(x):
    return x < 0 and -x or x

# Return True if x is an even number. Otherwise False.
def even(x):
    return x % 2 == 0

# Return False if x is an odd number. Otherwise True.    
def odd(x):
    return not even(x)

# Return True if all elements of the sequence are true (or if the sequence
# is empty).
def all(seq):
    def accumulator(result, element):
        if not element:
            return False
        else:
            return result
    return reduce(accumulator, seq, True)

# Return True if any element of the sequence is true. If the iterable
# is empty, return False.
def any(seq):
    def accumulator(result, element):
        if element:
            return True
        else:
            return result
    return reduce(accumulator, seq, False)

# Return seq as a new list sorted in ascending order.
# The heap sort algorithm used actually does in-place sorting, but
# the sorted() function in the Python library returns a new list,
# so we follow that.
def sorted(seq):
    def transform_to_maxheap():
        array = seq + []
        for i in range(1, len(array)):
            bubbleup(i, array)
    
        return array
        
    def swap(array, idx1, idx2):
        tmp = array[idx1]
        array[idx1] = array[idx2]
        array[idx2] = tmp
    
    def bubbledown(current, array, last):
        child = idxofchild(current, array, last)
        
        if child != -1 and array[current] < array[child]:
            swap(array, child, current)
            bubbledown(child, array, last)
        
    def bubbleup(child, array):
        parent = idxofparent(child)
        
        if child > 0 and array[child] > array[parent]:
            swap(array, parent, child)
            bubbleup(parent, array)
    
    def idxofchild(parent, array, last):
        left = parent * 2 + 1
        right = parent * 2 + 2
        
        if left >= last:
            return -1
            
        if array[left] > array[right]:
            return left
        else:
            return right
            
    def idxofparent(child):
        if child % 2 == 0:
            return child // 2 - 1
        else:
            return child // 2
        
    array = transform_to_maxheap()
    i = len(array) - 1
    
    while i > 0:
        if i == 1 and array[0] <= array[1]:
            return array
            
        swap(array, 0, i)
        bubbledown(0, array, i - 1)
        i = i - 1

    return array
