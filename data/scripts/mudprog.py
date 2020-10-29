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

# Return number of objects with vnum == objvnum carried by actor.
# Note the difference between ovnumcarry() and ovnuminv().
# ovnuminv() skips past equipped items, while ovnumcarry()
# looks at every object.
def ovnumcarry(actor, objvnum):
    def count_occurances(accu, obj):
        if vnum(obj) == objvnum:
            accu = accu + count(obj)

        return accu

    return reduce(count_occurances, objects(actor), 0)

