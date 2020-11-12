# Make a string that is "width" characters long. Put "text" in the middle,
# and pad the gaps with the string "pad" which must be zero or one
# character long.
def centerstring(text, width, pad):
    if len(pad) > 1:
        error("pad must be max 1 character long.")
        
    line = pad * (width // 2 - len(text) // 2) + text
    line = line + pad * (width - len(line))
    return line
