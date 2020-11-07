# Misc functions that we know and love(?) from legacy mud prog.
# In many cases they're slightly different from the original, especially
# when it comes to arguments.

from python import *

# Return number of objects with vnum == objvnum in actor's
# inventory. Equipped objects are ignored.
def ovnuminv(actor, objvnum):
    def count_occurances(accu, obj):
        if not equipped(obj) and vnum(obj) == objvnum:
            accu = accu + count(obj)
        return accu
    return reduce(count_occurances, objects(actor), 0)

# Return number of objects with vnum == objvnum in container.
# If container is a character, then return ALL items whether
# they're equipped or not
#
# Replaces ovnumcarry, ovnuminobj, iscarrying, ovnumroom
def ovnumincontainer(container, objvnum):
    def count_occurances(accu, obj):
        if vnum(obj) == objvnum:
            accu = accu + count(obj)
        return accu
    return reduce(count_occurances, objects(container), 0)

# Return number of instances of objects with a certain item type
# in a container.
#
# Replaces otypeinobj, otypecarry, otyperoom
def otypeincontainer(container, otype):
    def count_occurances(accu, o):
        if objtype(o) == otype:
            accu = accu + count(o)
        return accu
    return reduce(count_occurances, objects(container), 0)
