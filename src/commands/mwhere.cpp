#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "act.hpp"

void do_mwhere(std::shared_ptr<Character> ch, std::string arg)
{
    bool found = false;

    if(arg.empty())
    {
        ch->Echo("Mwhere whom?\r\n");
        return;
    }

    SetCharacterColor(AT_PLAIN, ch);

    for(auto victim = FirstCharacter; victim; victim = victim->Next)
    {
        if(IsNpc(victim)
           && victim->InRoom
           && NiftyIsName(arg, victim->Name))
        {
            found = true;
            ch->Echo("[%5ld] %-28s [%5ld] %s\r\n",
                     victim->Prototype->Vnum,
                     victim->ShortDescr.c_str(),
                     victim->InRoom->Vnum,
                     victim->InRoom->Name.c_str());
        }
    }

    if(!found)
        Act(AT_PLAIN, "You didn't find any $T.", ch, nullptr, arg, ActTarget::Char);
}
