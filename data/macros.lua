-- MudProg macros
-- Last saved Wednesday 08-Jul-2020 00:49:16

MacroEntry
{
   Text = "-- Takes 3 arguments. Each must be an object vnum. Equal chance\
-- of opoload'ing one of them.\
def opoload_one_of\
    if rand(33)\
        opoload $1\
    elif rand(50)\
        opoload $2\
    else\
        opoload $3\
    endif\
enddef\
", 
}
