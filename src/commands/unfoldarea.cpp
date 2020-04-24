#include "mud.hpp"
#include "area.hpp"
#include "character.hpp"
#include "repos/arearepository.hpp"

/*
 * Dangerous command.  Can be used to install an area that was either:
 *   (a) already installed but removed from area.lst
 *   (b) designed offline
 * The mud will likely crash if:
 *   (a) this area is already loaded
 *   (b) it contains vnums that exist
 *   (c) the area has errors
 *
 * NOTE: Use of this command is not recommended.                -Thoric
 */
void do_unfoldarea(Character* ch, std::string argument)
{
    if (argument.empty())
    {
        ch->Echo("Unfold what?\r\n");
        return;
    }

    fBootDb = true;
    LoadAreaFile(Areas->LastArea, argument);
    fBootDb = false;
}

