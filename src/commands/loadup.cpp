#include <cctype>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "descriptor.hpp"

void do_loadup(Character *ch, std::string argument)
{
    char fname[1024];
    std::string name;
    struct stat fst;
    vnum_t old_room_vnum = INVALID_VNUM;
    char buf[MAX_STRING_LENGTH];

    OneArgument(argument, name);

    if (name.empty())
    {
        ch->Echo("Usage: loadup <playername>\r\n");
        return;
    }

    name[0] = CharToUppercase(name[0]);

    sprintf(fname, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
        Capitalize(ToLower(name)).c_str());

    if (stat(fname, &fst) != -1)
    {
        Descriptor *d = new NullDescriptor();

        ///////////////////////////////////////////////
        //                                           //
        // FOR SOME WEIRD REASON THE CODE THAT LOADS //
        // THE CHARACTER IS MISSING!                 //
        //                                           //
        ///////////////////////////////////////////////

        assert(d->Character != nullptr);

        AddCharacter(d->Character);
        old_room_vnum = d->Character->InRoom->Vnum;
        CharacterToRoom(d->Character, ch->InRoom);

        if (GetTrustLevel(d->Character) >= GetTrustLevel(ch))
        {
            do_say(d->Character, "Do *NOT* disturb me again!");
            ch->Echo("I think you'd better leave that player alone!\r\n");
            d->Character->Desc = NULL;
            do_quit(d->Character, "");
            return;
        }

        d->Character->Desc = NULL;
        d->Character->ReTran = old_room_vnum;
        d->Character = NULL;
        delete d;
        ch->Echo("Player %s loaded from room %ld.\r\n",
            Capitalize(name).c_str(), old_room_vnum);
        sprintf(buf, "%s appears from nowhere, eyes glazed over.\r\n",
            Capitalize(name).c_str());
        Act(AT_IMMORT, buf, ch, NULL, NULL, TO_ROOM);

        ch->Echo("Done.\r\n");
        return;
    }

    ch->Echo("No such player.\r\n");
}
