# Huh?
def main():
    if isnpc(actor):
        echo(actor, "You're a mob!")
    else:
        echo(actor, "You're a player!")

def ispc(ch):
    return not isnpc(ch)
