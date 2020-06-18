#include <sstream>
#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"
#include "room.hpp"

void do_awho(std::shared_ptr<Character> ch, std::string argument)
{
    std::ostringstream output;
    char buf[MAX_INPUT_LENGTH];
    int num = CharactersInArena();

    if(num == 0)
    {
        ch->Echo("There is noone in the arena right now.\r\n");
        return;
    }

    output << "&W  Players in the &BRise in Power&W Arena\r\n"
        << "%s-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-"
        << "%s&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-\r\n";

    sprintf(buf, "Game Length = &R%-3d   &WTime To Start &R%-3d\r\n", arena.GameLength, arena.TimeToStart);
    output << buf;

    sprintf(buf, "&WLevel Limits &R%d &Wto &R%d\r\n", arena.MinLevel, arena.MaxLevel);
    output << buf;

    sprintf(buf, "         &WJackpot = &R%d\r\n", arena.ArenaPot);
    output << buf;

    output << "%s&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B"
        << "%s-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B\r\n";
    ch->Echo("%s", output.str().c_str());

    for(auto tch = FirstCharacter; tch; tch = tch->Next)
    {
        if(IsInArena(tch)
           && tch->TopLevel < LEVEL_IMMORTAL)
        {
            tch->Echo("&W%s\r\n", tch->Name.c_str());
        }
    }
}

