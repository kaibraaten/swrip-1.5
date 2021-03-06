#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_gold(std::shared_ptr<Character> ch, std::string argument)
{
    SetCharacterColor(AT_GOLD, ch);
    ch->Echo("You have %d credits", ch->Gold);

    if(!IsNpc(ch))
    {
        ch->Echo(", and %ld credits in the bank", ch->PCData->Bank);
    }

    ch->Echo(".\r\n");
}

