from python import *

# Make a string that is "width" characters long. Put "text" in the middle,
# and pad the gaps with the string "pad" which must be zero or one
# character long.
def centerstring(text, width, pad):
    if len(pad) > 1:
        error("pad must be max 1 character long.")
        
    line = pad * (width // 2 - len(text) // 2) + text
    line = line + pad * (width - len(line))
    return line

# Return a function object that returns a new random number every time it's called.
# The same seed will always give the same sequence of numbers.
def makerand(seed):
    last = [seed]
    a = 1103515245
    c = 12345
    m = pow(2, 31)
    def next():
        last[0] = (a * last[0] + c) % m
        return last[0]
    return next
